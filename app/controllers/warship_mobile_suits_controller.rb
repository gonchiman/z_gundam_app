class WarshipMobileSuitsController < ApplicationController
  before_action :set_warship_mobile_suit, only: %i[ destroy ]

  def new
    @warship = Warship.find(params[:warship_id])
    @warship_mobile_suit = WarshipMobileSuit.new(warship: @warship)
  end

  def create
    permitted_params = warship_mobile_suit_params
    @warship_mobile_suit = WarshipMobileSuit.find_or_initialize_by(
      warship_id: permitted_params[:warship_id],
      mobile_suit_id: permitted_params[:mobile_suit_id]
    )
    @warship_mobile_suit.quantity = @warship_mobile_suit.persisted? ? @warship_mobile_suit.quantity + 1 : 1

    respond_to do |format|
      if @warship_mobile_suit.save
        format.html { redirect_to @warship_mobile_suit.warship, notice: "Mobile suit was successfully purchased." }
        format.json { render json: @warship_mobile_suit, status: :created }
      else
        warship = Warship.find(permitted_params[:warship_id])
        format.html { redirect_to warship, alert: @warship_mobile_suit.errors.full_messages.join(", "), status: :see_other }
        format.json { render json: @warship_mobile_suit.errors, status: :unprocessable_content }
      end
    end
  end

  def destroy
    warship = @warship_mobile_suit.warship
    assigned_pilot_assignments = warship.pilot_assignments.where(mobile_suit_id: @warship_mobile_suit.mobile_suit_id)

    respond_to do |format|
      if @warship_mobile_suit.quantity > 1
        new_quantity = @warship_mobile_suit.quantity - 1
        assignments_to_clear_count = [assigned_pilot_assignments.count - new_quantity, 0].max

        if assignments_to_clear_count > 0
          assigned_pilot_assignments.order(updated_at: :desc).limit(assignments_to_clear_count).each do |pilot_assignment|
            pilot_assignment.update!(mobile_suit_id: nil)
          end
        end

        @warship_mobile_suit.update!(quantity: new_quantity)
        format.html { redirect_to warship, notice: "Mobile suit quantity was successfully decreased.", status: :see_other }
        format.json { head :no_content }
      else
        assigned_pilot_assignments.update_all(mobile_suit_id: nil, updated_at: Time.current)
        @warship_mobile_suit.destroy!
        format.html { redirect_to warship, notice: "Mobile suit was successfully removed.", status: :see_other }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_warship_mobile_suit
      @warship_mobile_suit = WarshipMobileSuit.find(params.expect(:id))
    end

    def warship_mobile_suit_params
      params.expect(warship_mobile_suit: [ :warship_id, :mobile_suit_id ])
    end
end
