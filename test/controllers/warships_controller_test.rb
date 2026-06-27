require "test_helper"

class WarshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warship = warships(:one)
  end

  test "should get index" do
    get warships_url
    assert_response :success
  end

  test "should get new" do
    get new_warship_url
    assert_response :success
  end

  test "should create warship" do
    assert_difference("Warship.count") do
      post warships_url, params: { warship: { captain_id: @warship.captain_id, name: @warship.name } }
    end

    assert_redirected_to warship_url(Warship.last)
  end

  test "should show warship" do
    get warship_url(@warship)
    assert_response :success
  end

  test "should get edit" do
    get edit_warship_url(@warship)
    assert_response :success
  end

  test "should update warship" do
    patch warship_url(@warship), params: { warship: { captain_id: @warship.captain_id, name: @warship.name } }
    assert_redirected_to warship_url(@warship)
  end

  test "should destroy warship" do
    assert_difference("Warship.count", -1) do
      delete warship_url(@warship)
    end

    assert_redirected_to warships_url
  end
end
