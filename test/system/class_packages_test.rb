require "application_system_test_case"

class ClassPackagesTest < ApplicationSystemTestCase
  setup do
    @class_package = class_packages(:one)
  end

  test "visiting the index" do
    visit class_packages_url
    assert_selector "h1", text: "Class packages"
  end

  test "should create class package" do
    visit class_packages_url
    click_on "New class package"

    fill_in "Available date", with: @class_package.available_date
    fill_in "Description", with: @class_package.description
    fill_in "Duration", with: @class_package.duration
    fill_in "Name", with: @class_package.name
    fill_in "Price", with: @class_package.price
    fill_in "Status", with: @class_package.status
    fill_in "Trainers", with: @class_package.trainers_id
    click_on "Create Class package"

    assert_text "Class package was successfully created"
    click_on "Back"
  end

  test "should update Class package" do
    visit class_package_url(@class_package)
    click_on "Edit this class package", match: :first

    fill_in "Available date", with: @class_package.available_date
    fill_in "Description", with: @class_package.description
    fill_in "Duration", with: @class_package.duration
    fill_in "Name", with: @class_package.name
    fill_in "Price", with: @class_package.price
    fill_in "Status", with: @class_package.status
    fill_in "Trainers", with: @class_package.trainers_id
    click_on "Update Class package"

    assert_text "Class package was successfully updated"
    click_on "Back"
  end

  test "should destroy Class package" do
    visit class_package_url(@class_package)
    click_on "Destroy this class package", match: :first

    assert_text "Class package was successfully destroyed"
  end
end
