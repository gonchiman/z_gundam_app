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
    @pilot_assignment = PilotAssignment.new(warship_id: params[:warship_id])
    set_hire_pilot_page_data
  end

  # GET /pilot_assignments/1/edit
  def edit
  end

  # POST /pilot_assignments or /pilot_assignments.json
  def create
    @pilot_assignment = PilotAssignment.new(pilot_assignment_params)

    respond_to do |format|
      if @pilot_assignment.save
        format.html { redirect_to @pilot_assignment.warship, notice: "Pilot was successfully hired." }
        format.json { render :show, status: :created, location: @pilot_assignment }
      else
        set_hire_pilot_page_data
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @pilot_assignment.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /pilot_assignments/1 or /pilot_assignments/1.json
  def update
    respond_to do |format|
      if @pilot_assignment.update(pilot_assignment_params)
        format.html { redirect_to @pilot_assignment.warship, notice: "Mobile suit was successfully assigned.", status: :see_other }
        format.json { render :show, status: :ok, location: @pilot_assignment }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @pilot_assignment.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /pilot_assignments/1 or /pilot_assignments/1.json
  def destroy
    warship = @pilot_assignment.warship
    @pilot_assignment.destroy!

    respond_to do |format|
      format.html { redirect_to warship, notice: "Pilot assignment was successfully destroyed.", status: :see_other }
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

    def set_hire_pilot_page_data
      @warship = @pilot_assignment.warship
      return if @warship.blank?

      hired_crew_member_ids = @warship.pilot_assignments.select(:crew_member_id)
      @available_crew_members = CrewMember
        .where(role_type: ["pilot_only", "captain_and_pilot"])
        .where.not(id: hired_crew_member_ids)
        .order(:name)
    end
end
