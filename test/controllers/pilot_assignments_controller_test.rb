require "test_helper"

class PilotAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pilot_assignment = pilot_assignments(:one)
  end

  test "should get index" do
    get pilot_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_pilot_assignment_url
    assert_response :success
  end

  test "should create pilot_assignment" do
    assert_difference("PilotAssignment.count") do
      post pilot_assignments_url, params: { pilot_assignment: { crew_member_id: @pilot_assignment.crew_member_id, mobile_suit_id: @pilot_assignment.mobile_suit_id, warship_id: @pilot_assignment.warship_id } }
    end

    assert_redirected_to pilot_assignment_url(PilotAssignment.last)
  end

  test "should show pilot_assignment" do
    get pilot_assignment_url(@pilot_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_pilot_assignment_url(@pilot_assignment)
    assert_response :success
  end

  test "should update pilot_assignment" do
    patch pilot_assignment_url(@pilot_assignment), params: { pilot_assignment: { crew_member_id: @pilot_assignment.crew_member_id, mobile_suit_id: @pilot_assignment.mobile_suit_id, warship_id: @pilot_assignment.warship_id } }
    assert_redirected_to pilot_assignment_url(@pilot_assignment)
  end

  test "should destroy pilot_assignment" do
    assert_difference("PilotAssignment.count", -1) do
      delete pilot_assignment_url(@pilot_assignment)
    end

    assert_redirected_to pilot_assignments_url
  end
end
