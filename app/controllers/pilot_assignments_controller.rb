class PilotAssignmentsController < ApplicationController
  skip_before_action :require_authentication, only: [:index, :show]
  before_action :set_pilot_assignment, only: %i[ show edit update destroy ]

  # GET /pilot_assignments or /pilot_assignments.json
  def index
    @pilot_assignments = PilotAssignment.all
  end

  # GET /pilot_assignments/1 or /pilot_assignments/1.json
  def show
  end

  # GET /pilot_assignments/new
  def new
    @pilot_assignment = PilotAssignment.new
  end

  # GET /pilot_assignments/1/edit
  def edit
  end

  # POST /pilot_assignments or /pilot_assignments.json
  def create
    @pilot_assignment = PilotAssignment.new(pilot_assignment_params)

    respond_to do |format|
      if @pilot_assignment.save
        format.html { redirect_to @pilot_assignment, notice: "Pilot assignment was successfully created." }
        format.json { render :show, status: :created, location: @pilot_assignment }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @pilot_assignment.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /pilot_assignments/1 or /pilot_assignments/1.json
  def update
    respond_to do |format|
      if @pilot_assignment.update(pilot_assignment_params)
        format.html { redirect_to @pilot_assignment, notice: "Pilot assignment was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @pilot_assignment }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @pilot_assignment.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /pilot_assignments/1 or /pilot_assignments/1.json
  def destroy
    @pilot_assignment.destroy!

    respond_to do |format|
      format.html { redirect_to pilot_assignments_path, notice: "Pilot assignment was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pilot_assignment
      @pilot_assignment = PilotAssignment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def pilot_assignment_params
      params.expect(pilot_assignment: [ :warship_id, :crew_member_id, :mobile_suit_id ])
    end
end
