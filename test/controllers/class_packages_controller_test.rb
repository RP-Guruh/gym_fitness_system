require "test_helper"

class ClassPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_package = class_packages(:one)
  end

  test "should get index" do
    get class_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_class_package_url
    assert_response :success
  end

  test "should create class_package" do
    assert_difference("ClassPackage.count") do
      post class_packages_url, params: { class_package: { available_date: @class_package.available_date, description: @class_package.description, duration: @class_package.duration, name: @class_package.name, price: @class_package.price, status: @class_package.status, trainers_id: @class_package.trainers_id } }
    end

    assert_redirected_to class_package_url(ClassPackage.last)
  end

  test "should show class_package" do
    get class_package_url(@class_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_package_url(@class_package)
    assert_response :success
  end

  test "should update class_package" do
    patch class_package_url(@class_package), params: { class_package: { available_date: @class_package.available_date, description: @class_package.description, duration: @class_package.duration, name: @class_package.name, price: @class_package.price, status: @class_package.status, trainers_id: @class_package.trainers_id } }
    assert_redirected_to class_package_url(@class_package)
  end

  test "should destroy class_package" do
    assert_difference("ClassPackage.count", -1) do
      delete class_package_url(@class_package)
    end

    assert_redirected_to class_packages_url
  end
end
