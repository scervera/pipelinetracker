require "application_system_test_case"

class SalepeopleTest < ApplicationSystemTestCase
  setup do
    @saleperson = salepeople(:one)
  end

  test "visiting the index" do
    visit salepeople_url
    assert_selector "h1", text: "Salepeople"
  end

  test "creating a Saleperson" do
    visit salepeople_url
    click_on "New Saleperson"

    fill_in "Carrier", with: @saleperson.carrier
    fill_in "Firstname", with: @saleperson.firstname
    fill_in "Lastname", with: @saleperson.lastname
    click_on "Create Saleperson"

    assert_text "Saleperson was successfully created"
    click_on "Back"
  end

  test "updating a Saleperson" do
    visit salepeople_url
    click_on "Edit", match: :first

    fill_in "Carrier", with: @saleperson.carrier
    fill_in "Firstname", with: @saleperson.firstname
    fill_in "Lastname", with: @saleperson.lastname
    click_on "Update Saleperson"

    assert_text "Saleperson was successfully updated"
    click_on "Back"
  end

  test "destroying a Saleperson" do
    visit salepeople_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saleperson was successfully destroyed"
  end
end
