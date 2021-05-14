require 'test_helper'

class AppleCaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apple_care = apple_cares(:one)
  end

  test "should get index" do
    get apple_cares_url
    assert_response :success
  end

  test "should get new" do
    get new_apple_care_url
    assert_response :success
  end

  test "should create apple_care" do
    assert_difference('AppleCare.count') do
      post apple_cares_url, params: { apple_care: { product: @apple_care.product } }
    end

    assert_redirected_to apple_care_url(AppleCare.last)
  end

  test "should show apple_care" do
    get apple_care_url(@apple_care)
    assert_response :success
  end

  test "should get edit" do
    get edit_apple_care_url(@apple_care)
    assert_response :success
  end

  test "should update apple_care" do
    patch apple_care_url(@apple_care), params: { apple_care: { product: @apple_care.product } }
    assert_redirected_to apple_care_url(@apple_care)
  end

  test "should destroy apple_care" do
    assert_difference('AppleCare.count', -1) do
      delete apple_care_url(@apple_care)
    end

    assert_redirected_to apple_cares_url
  end
end
