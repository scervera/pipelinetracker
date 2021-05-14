require "application_system_test_case"

class AppleCaresTest < ApplicationSystemTestCase
  setup do
    @apple_care = apple_cares(:one)
  end

  test "visiting the index" do
    visit apple_cares_url
    assert_selector "h1", text: "Apple Cares"
  end

  test "creating a Apple care" do
    visit apple_cares_url
    click_on "New Apple Care"

    fill_in "Product", with: @apple_care.product
    click_on "Create Apple care"

    assert_text "Apple care was successfully created"
    click_on "Back"
  end

  test "updating a Apple care" do
    visit apple_cares_url
    click_on "Edit", match: :first

    fill_in "Product", with: @apple_care.product
    click_on "Update Apple care"

    assert_text "Apple care was successfully updated"
    click_on "Back"
  end

  test "destroying a Apple care" do
    visit apple_cares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Apple care was successfully destroyed"
  end
end
