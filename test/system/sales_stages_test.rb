require "application_system_test_case"

class SalesStagesTest < ApplicationSystemTestCase
  setup do
    @sales_stage = sales_stages(:one)
  end

  test "visiting the index" do
    visit sales_stages_url
    assert_selector "h1", text: "Sales Stages"
  end

  test "creating a Sales stage" do
    visit sales_stages_url
    click_on "New Sales Stage"

    fill_in "Stage", with: @sales_stage.stage
    click_on "Create Sales stage"

    assert_text "Sales stage was successfully created"
    click_on "Back"
  end

  test "updating a Sales stage" do
    visit sales_stages_url
    click_on "Edit", match: :first

    fill_in "Stage", with: @sales_stage.stage
    click_on "Update Sales stage"

    assert_text "Sales stage was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales stage" do
    visit sales_stages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales stage was successfully destroyed"
  end
end
