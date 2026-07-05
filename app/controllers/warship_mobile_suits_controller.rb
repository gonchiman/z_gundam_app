class WarshipMobileSuitsController < ApplicationController
  before_action :set_warship_mobile_suit, only: %i[ destroy ]

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
    assigned_count = warship.pilot_assignments.where(mobile_suit_id: @warship_mobile_suit.mobile_suit_id).count

    respond_to do |format|
      if assigned_count >= @warship_mobile_suit.quantity
        format.html { redirect_to warship, alert: "This mobile suit is assigned to a pilot.", status: :see_other }
        format.json { render json: { error: "mobile suit is assigned" }, status: :unprocessable_content }
      elsif @warship_mobile_suit.quantity > 1
        @warship_mobile_suit.update!(quantity: @warship_mobile_suit.quantity - 1)
        format.html { redirect_to warship, notice: "Mobile suit quantity was successfully decreased.", status: :see_other }
        format.json { head :no_content }
      else
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
