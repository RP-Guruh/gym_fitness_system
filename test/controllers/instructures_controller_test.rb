require "test_helper"

class InstructuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instructure = instructures(:one)
  end

  test "should get index" do
    get instructures_url
    assert_response :success
  end

  test "should get new" do
    get new_instructure_url
    assert_response :success
  end

  test "should create instructure" do
    assert_difference("Instructure.count") do
      post instructures_url, params: { instructure: { address: @instructure.address, city: @instructure.city, created_by: @instructure.created_by, created_by_name: @instructure.created_by_name, email: @instructure.email, gender: @instructure.gender, handphone_number: @instructure.handphone_number, join_date: @instructure.join_date, name: @instructure.name, province: @instructure.province, status: @instructure.status, updated_by: @instructure.updated_by, updated_by_name: @instructure.updated_by_name, user_id: @instructure.user_id } }
    end

    assert_redirected_to instructure_url(Instructure.last)
  end

  test "should show instructure" do
    get instructure_url(@instructure)
    assert_response :success
  end

  test "should get edit" do
    get edit_instructure_url(@instructure)
    assert_response :success
  end

  test "should update instructure" do
    patch instructure_url(@instructure), params: { instructure: { address: @instructure.address, city: @instructure.city, created_by: @instructure.created_by, created_by_name: @instructure.created_by_name, email: @instructure.email, gender: @instructure.gender, handphone_number: @instructure.handphone_number, join_date: @instructure.join_date, name: @instructure.name, province: @instructure.province, status: @instructure.status, updated_by: @instructure.updated_by, updated_by_name: @instructure.updated_by_name, user_id: @instructure.user_id } }
    assert_redirected_to instructure_url(@instructure)
  end

  test "should destroy instructure" do
    assert_difference("Instructure.count", -1) do
      delete instructure_url(@instructure)
    end

    assert_redirected_to instructures_url
  end
end
