require "application_system_test_case"

class MembershipPackagesTest < ApplicationSystemTestCase
  setup do
    @membership_package = membership_packages(:one)
  end

  test "visiting the index" do
    visit membership_packages_url
    assert_selector "h1", text: "Membership packages"
  end

  test "should create membership package" do
    visit membership_packages_url
    click_on "New membership package"

    fill_in "Description", with: @membership_package.description
    fill_in "Duration", with: @membership_package.duration
    fill_in "Name", with: @membership_package.name
    fill_in "Price", with: @membership_package.price
    fill_in "Status", with: @membership_package.status
    click_on "Create Membership package"

    assert_text "Membership package was successfully created"
    click_on "Back"
  end

  test "should update Membership package" do
    visit membership_package_url(@membership_package)
    click_on "Edit this membership package", match: :first

    fill_in "Description", with: @membership_package.description
    fill_in "Duration", with: @membership_package.duration
    fill_in "Name", with: @membership_package.name
    fill_in "Price", with: @membership_package.price
    fill_in "Status", with: @membership_package.status
    click_on "Update Membership package"

    assert_text "Membership package was successfully updated"
    click_on "Back"
  end

  test "should destroy Membership package" do
    visit membership_package_url(@membership_package)
    click_on "Destroy this membership package", match: :first

    assert_text "Membership package was successfully destroyed"
  end
end
