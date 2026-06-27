require "test_helper"

class MobileSuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mobile_suit = mobile_suits(:one)
  end

  test "should get index" do
    get mobile_suits_url
    assert_response :success
  end

  test "should get new" do
    get new_mobile_suit_url
    assert_response :success
  end

  test "should create mobile_suit" do
    assert_difference("MobileSuit.count") do
      post mobile_suits_url, params: { mobile_suit: { name: @mobile_suit.name, warship_id: @mobile_suit.warship_id } }
    end

    assert_redirected_to mobile_suit_url(MobileSuit.last)
  end

  test "should show mobile_suit" do
    get mobile_suit_url(@mobile_suit)
    assert_response :success
  end

  test "should get edit" do
    get edit_mobile_suit_url(@mobile_suit)
    assert_response :success
  end

  test "should update mobile_suit" do
    patch mobile_suit_url(@mobile_suit), params: { mobile_suit: { name: @mobile_suit.name, warship_id: @mobile_suit.warship_id } }
    assert_redirected_to mobile_suit_url(@mobile_suit)
  end

  test "should destroy mobile_suit" do
    assert_difference("MobileSuit.count", -1) do
      delete mobile_suit_url(@mobile_suit)
    end

    assert_redirected_to mobile_suits_url
  end
end
