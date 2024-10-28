require "test_helper"

class DateClassAvailablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date_class_available = date_class_availables(:one)
  end

  test "should get index" do
    get date_class_availables_url
    assert_response :success
  end

  test "should get new" do
    get new_date_class_available_url
    assert_response :success
  end

  test "should create date_class_available" do
    assert_difference("DateClassAvailable.count") do
      post date_class_availables_url, params: { date_class_available: { ClassPackage_id: @date_class_available.ClassPackage_id, available_date: @date_class_available.available_date, note: @date_class_available.note } }
    end

    assert_redirected_to date_class_available_url(DateClassAvailable.last)
  end

  test "should show date_class_available" do
    get date_class_available_url(@date_class_available)
    assert_response :success
  end

  test "should get edit" do
    get edit_date_class_available_url(@date_class_available)
    assert_response :success
  end

  test "should update date_class_available" do
    patch date_class_available_url(@date_class_available), params: { date_class_available: { ClassPackage_id: @date_class_available.ClassPackage_id, available_date: @date_class_available.available_date, note: @date_class_available.note } }
    assert_redirected_to date_class_available_url(@date_class_available)
  end

  test "should destroy date_class_available" do
    assert_difference("DateClassAvailable.count", -1) do
      delete date_class_available_url(@date_class_available)
    end

    assert_redirected_to date_class_availables_url
  end
end
