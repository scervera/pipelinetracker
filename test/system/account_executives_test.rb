require "application_system_test_case"

class AccountExecutivesTest < ApplicationSystemTestCase
  setup do
    @account_executive = account_executives(:one)
  end

  test "visiting the index" do
    visit account_executives_url
    assert_selector "h1", text: "Account Executives"
  end

  test "creating a Account executive" do
    visit account_executives_url
    click_on "New Account Executive"

    fill_in "Carrier", with: @account_executive.carrier
    fill_in "Firstname", with: @account_executive.firstname
    fill_in "Lastname", with: @account_executive.lastname
    click_on "Create Account executive"

    assert_text "Account executive was successfully created"
    click_on "Back"
  end

  test "updating a Account executive" do
    visit account_executives_url
    click_on "Edit", match: :first

    fill_in "Carrier", with: @account_executive.carrier
    fill_in "Firstname", with: @account_executive.firstname
    fill_in "Lastname", with: @account_executive.lastname
    click_on "Update Account executive"

    assert_text "Account executive was successfully updated"
    click_on "Back"
  end

  test "destroying a Account executive" do
    visit account_executives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Account executive was successfully destroyed"
  end
end
