require "test_helper"

class VillagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @village = villages(:one)
  end

  test "should get index" do
    get villages_url
    assert_response :success
  end

  test "should get new" do
    get new_village_url
    assert_response :success
  end

  test "should create village" do
    assert_difference("Village.count") do
      post villages_url, params: { village: { created_by: @village.created_by, created_by_name: @village.created_by_name, name: @village.name, updated_by: @village.updated_by, updated_by_name: @village.updated_by_name } }
    end

    assert_redirected_to village_url(Village.last)
  end

  test "should show village" do
    get village_url(@village)
    assert_response :success
  end

  test "should get edit" do
    get edit_village_url(@village)
    assert_response :success
  end

  test "should update village" do
    patch village_url(@village), params: { village: { created_by: @village.created_by, created_by_name: @village.created_by_name, name: @village.name, updated_by: @village.updated_by, updated_by_name: @village.updated_by_name } }
    assert_redirected_to village_url(@village)
  end

  test "should destroy village" do
    assert_difference("Village.count", -1) do
      delete village_url(@village)
    end

    assert_redirected_to villages_url
  end
end
