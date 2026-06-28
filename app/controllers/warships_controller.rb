class WarshipsController < ApplicationController
  skip_before_action :require_authentication, only: [:index, :show]
  before_action :set_warship, only: %i[ show edit update destroy ]

  # GET /warships or /warships.json
  def index
    @warships = Warship.all
  end

  # GET /warships/1 or /warships/1.json
  def show
  end

  # GET /warships/new
  def new
    @warship = Warship.new
  end

  # GET /warships/1/edit
  def edit
  end

  # POST /warships or /warships.json
  def create
    @warship = Warship.new(warship_params)

    respond_to do |format|
      if @warship.save
        format.html { redirect_to @warship, notice: "Warship was successfully created." }
        format.json { render :show, status: :created, location: @warship }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @warship.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /warships/1 or /warships/1.json
  def update
    respond_to do |format|
      if @warship.update(warship_params)
        format.html { redirect_to @warship, notice: "Warship was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @warship }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @warship.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /warships/1 or /warships/1.json
  def destroy
    @warship.destroy!

    respond_to do |format|
      format.html { redirect_to warships_path, notice: "Warship was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warship
      @warship = Warship.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def warship_params
      params.expect(warship: [ :name, :captain_id ])
    end
end
