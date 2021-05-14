require 'test_helper'

class AccountExecutivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_executive = account_executives(:one)
  end

  test "should get index" do
    get account_executives_url
    assert_response :success
  end

  test "should get new" do
    get new_account_executive_url
    assert_response :success
  end

  test "should create account_executive" do
    assert_difference('AccountExecutive.count') do
      post account_executives_url, params: { account_executive: { carrier: @account_executive.carrier, firstname: @account_executive.firstname, lastname: @account_executive.lastname } }
    end

    assert_redirected_to account_executive_url(AccountExecutive.last)
  end

  test "should show account_executive" do
    get account_executive_url(@account_executive)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_executive_url(@account_executive)
    assert_response :success
  end

  test "should update account_executive" do
    patch account_executive_url(@account_executive), params: { account_executive: { carrier: @account_executive.carrier, firstname: @account_executive.firstname, lastname: @account_executive.lastname } }
    assert_redirected_to account_executive_url(@account_executive)
  end

  test "should destroy account_executive" do
    assert_difference('AccountExecutive.count', -1) do
      delete account_executive_url(@account_executive)
    end

    assert_redirected_to account_executives_url
  end
end
