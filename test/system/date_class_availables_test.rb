require "application_system_test_case"

class DateClassAvailablesTest < ApplicationSystemTestCase
  setup do
    @date_class_available = date_class_availables(:one)
  end

  test "visiting the index" do
    visit date_class_availables_url
    assert_selector "h1", text: "Date class availables"
  end

  test "should create date class available" do
    visit date_class_availables_url
    click_on "New date class available"

    fill_in "Classpackage", with: @date_class_available.ClassPackage_id
    fill_in "Available date", with: @date_class_available.available_date
    fill_in "Note", with: @date_class_available.note
    click_on "Create Date class available"

    assert_text "Date class available was successfully created"
    click_on "Back"
  end

  test "should update Date class available" do
    visit date_class_available_url(@date_class_available)
    click_on "Edit this date class available", match: :first

    fill_in "Classpackage", with: @date_class_available.ClassPackage_id
    fill_in "Available date", with: @date_class_available.available_date
    fill_in "Note", with: @date_class_available.note
    click_on "Update Date class available"

    assert_text "Date class available was successfully updated"
    click_on "Back"
  end

  test "should destroy Date class available" do
    visit date_class_available_url(@date_class_available)
    click_on "Destroy this date class available", match: :first

    assert_text "Date class available was successfully destroyed"
  end
end
