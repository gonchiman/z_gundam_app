class WarshipMobileSuitsController < ApplicationController
  before_action :set_warship_mobile_suit, only: %i[ destroy ]

  def create
    @warship_mobile_suit = WarshipMobileSuit.new(warship_mobile_suit_params)

    respond_to do |format|
      if @warship_mobile_suit.save
        format.html { redirect_to @warship_mobile_suit.warship, notice: "Mobile suit was successfully purchased." }
        format.json { render json: @warship_mobile_suit, status: :created }
      else
        warship = Warship.find(warship_mobile_suit_params[:warship_id])
        format.html { redirect_to warship, alert: @warship_mobile_suit.errors.full_messages.join(", "), status: :see_other }
        format.json { render json: @warship_mobile_suit.errors, status: :unprocessable_content }
      end
    end
  end

  def destroy
    warship = @warship_mobile_suit.warship
    warship.pilot_assignments.where(mobile_suit_id: @warship_mobile_suit.mobile_suit_id).update_all(mobile_suit_id: nil)
    @warship_mobile_suit.destroy!

    respond_to do |format|
      format.html { redirect_to warship, notice: "Mobile suit was successfully removed.", status: :see_other }
      format.json { head :no_content }
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
