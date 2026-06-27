require "test_helper"

class CrewMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crew_member = crew_members(:one)
  end

  test "should get index" do
    get crew_members_url
    assert_response :success
  end

  test "should get new" do
    get new_crew_member_url
    assert_response :success
  end

  test "should create crew_member" do
    assert_difference("CrewMember.count") do
      post crew_members_url, params: { crew_member: { gender: @crew_member.gender, name: @crew_member.name, rank: @crew_member.rank, role_type: @crew_member.role_type } }
    end

    assert_redirected_to crew_member_url(CrewMember.last)
  end

  test "should show crew_member" do
    get crew_member_url(@crew_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_crew_member_url(@crew_member)
    assert_response :success
  end

  test "should update crew_member" do
    patch crew_member_url(@crew_member), params: { crew_member: { gender: @crew_member.gender, name: @crew_member.name, rank: @crew_member.rank, role_type: @crew_member.role_type } }
    assert_redirected_to crew_member_url(@crew_member)
  end

  test "should destroy crew_member" do
    assert_difference("CrewMember.count", -1) do
      delete crew_member_url(@crew_member)
    end

    assert_redirected_to crew_members_url
  end
end
