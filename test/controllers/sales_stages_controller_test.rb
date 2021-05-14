require 'test_helper'

class SalesStagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_stage = sales_stages(:one)
  end

  test "should get index" do
    get sales_stages_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_stage_url
    assert_response :success
  end

  test "should create sales_stage" do
    assert_difference('SalesStage.count') do
      post sales_stages_url, params: { sales_stage: { stage: @sales_stage.stage } }
    end

    assert_redirected_to sales_stage_url(SalesStage.last)
  end

  test "should show sales_stage" do
    get sales_stage_url(@sales_stage)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_stage_url(@sales_stage)
    assert_response :success
  end

  test "should update sales_stage" do
    patch sales_stage_url(@sales_stage), params: { sales_stage: { stage: @sales_stage.stage } }
    assert_redirected_to sales_stage_url(@sales_stage)
  end

  test "should destroy sales_stage" do
    assert_difference('SalesStage.count', -1) do
      delete sales_stage_url(@sales_stage)
    end

    assert_redirected_to sales_stages_url
  end
end
