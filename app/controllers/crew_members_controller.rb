class CrewMembersController < ApplicationController
  before_action :set_crew_member, only: %i[ show edit update destroy ]

  # GET /crew_members or /crew_members.json
  def index
    @crew_members = CrewMember.all
  end

  # GET /crew_members/1 or /crew_members/1.json
  def show
  end

  # GET /crew_members/new
  def new
    @crew_member = CrewMember.new
  end

  # GET /crew_members/1/edit
  def edit
  end

  # POST /crew_members or /crew_members.json
  def create
    @crew_member = CrewMember.new(crew_member_params)

    respond_to do |format|
      if @crew_member.save
        format.html { redirect_to @crew_member, notice: "Crew member was successfully created." }
        format.json { render :show, status: :created, location: @crew_member }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @crew_member.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /crew_members/1 or /crew_members/1.json
  def update
    respond_to do |format|
      if @crew_member.update(crew_member_params)
        format.html { redirect_to @crew_member, notice: "Crew member was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @crew_member }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @crew_member.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /crew_members/1 or /crew_members/1.json
  def destroy
    @crew_member.destroy!

    respond_to do |format|
      format.html { redirect_to crew_members_path, notice: "Crew member was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew_member
      @crew_member = CrewMember.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def crew_member_params
      params.expect(crew_member: [ :name, :gender, :rank, :role_type ])
    end
end
