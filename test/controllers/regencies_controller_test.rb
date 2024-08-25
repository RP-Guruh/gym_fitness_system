require "test_helper"

class RegenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regency = regencies(:one)
  end

  test "should get index" do
    get regencies_url
    assert_response :success
  end

  test "should get new" do
    get new_regency_url
    assert_response :success
  end

  test "should create regency" do
    assert_difference("Regency.count") do
      post regencies_url, params: { regency: { created_by: @regency.created_by, created_by_name: @regency.created_by_name, name: @regency.name, updated_by: @regency.updated_by, updated_by_name: @regency.updated_by_name } }
    end

    assert_redirected_to regency_url(Regency.last)
  end

  test "should show regency" do
    get regency_url(@regency)
    assert_response :success
  end

  test "should get edit" do
    get edit_regency_url(@regency)
    assert_response :success
  end

  test "should update regency" do
    patch regency_url(@regency), params: { regency: { created_by: @regency.created_by, created_by_name: @regency.created_by_name, name: @regency.name, updated_by: @regency.updated_by, updated_by_name: @regency.updated_by_name } }
    assert_redirected_to regency_url(@regency)
  end

  test "should destroy regency" do
    assert_difference("Regency.count", -1) do
      delete regency_url(@regency)
    end

    assert_redirected_to regencies_url
  end
end
