class MobileSuitsController < ApplicationController
  before_action :set_mobile_suit, only: %i[ show edit update destroy ]

  # GET /mobile_suits or /mobile_suits.json
  def index
    @mobile_suits = MobileSuit.all
  end

  # GET /mobile_suits/1 or /mobile_suits/1.json
  def show
  end

  # GET /mobile_suits/new
  def new
    @mobile_suit = MobileSuit.new
  end

  # GET /mobile_suits/1/edit
  def edit
  end

  # POST /mobile_suits or /mobile_suits.json
  def create
    @mobile_suit = MobileSuit.new(mobile_suit_params)

    respond_to do |format|
      if @mobile_suit.save
        format.html { redirect_to @mobile_suit, notice: "Mobile suit was successfully created." }
        format.json { render :show, status: :created, location: @mobile_suit }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @mobile_suit.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /mobile_suits/1 or /mobile_suits/1.json
  def update
    respond_to do |format|
      if @mobile_suit.update(mobile_suit_params)
        format.html { redirect_to @mobile_suit, notice: "Mobile suit was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @mobile_suit }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @mobile_suit.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /mobile_suits/1 or /mobile_suits/1.json
  def destroy
    @mobile_suit.destroy!

    respond_to do |format|
      format.html { redirect_to mobile_suits_path, notice: "Mobile suit was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobile_suit
      @mobile_suit = MobileSuit.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mobile_suit_params
      params.expect(mobile_suit: [ :name, :image ])
    end
end
