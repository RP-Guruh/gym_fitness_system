require "test_helper"

class MembershipPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership_package = membership_packages(:one)
  end

  test "should get index" do
    get membership_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_membership_package_url
    assert_response :success
  end

  test "should create membership_package" do
    assert_difference("MembershipPackage.count") do
      post membership_packages_url, params: { membership_package: { description: @membership_package.description, duration: @membership_package.duration, name: @membership_package.name, price: @membership_package.price, status: @membership_package.status } }
    end

    assert_redirected_to membership_package_url(MembershipPackage.last)
  end

  test "should show membership_package" do
    get membership_package_url(@membership_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_membership_package_url(@membership_package)
    assert_response :success
  end

  test "should update membership_package" do
    patch membership_package_url(@membership_package), params: { membership_package: { description: @membership_package.description, duration: @membership_package.duration, name: @membership_package.name, price: @membership_package.price, status: @membership_package.status } }
    assert_redirected_to membership_package_url(@membership_package)
  end

  test "should destroy membership_package" do
    assert_difference("MembershipPackage.count", -1) do
      delete membership_package_url(@membership_package)
    end

    assert_redirected_to membership_packages_url
  end
end
