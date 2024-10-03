require "application_system_test_case"

class InstructuresTest < ApplicationSystemTestCase
  setup do
    @instructure = instructures(:one)
  end

  test "visiting the index" do
    visit instructures_url
    assert_selector "h1", text: "Instructures"
  end

  test "should create instructure" do
    visit instructures_url
    click_on "New instructure"

    fill_in "Address", with: @instructure.address
    fill_in "City", with: @instructure.city
    fill_in "Created by", with: @instructure.created_by
    fill_in "Created by name", with: @instructure.created_by_name
    fill_in "Email", with: @instructure.email
    fill_in "Gender", with: @instructure.gender
    fill_in "Handphone number", with: @instructure.handphone_number
    fill_in "Join date", with: @instructure.join_date
    fill_in "Name", with: @instructure.name
    fill_in "Province", with: @instructure.province
    fill_in "Status", with: @instructure.status
    fill_in "Updated by", with: @instructure.updated_by
    fill_in "Updated by name", with: @instructure.updated_by_name
    fill_in "User", with: @instructure.user_id
    click_on "Create Instructure"

    assert_text "Instructure was successfully created"
    click_on "Back"
  end

  test "should update Instructure" do
    visit instructure_url(@instructure)
    click_on "Edit this instructure", match: :first

    fill_in "Address", with: @instructure.address
    fill_in "City", with: @instructure.city
    fill_in "Created by", with: @instructure.created_by
    fill_in "Created by name", with: @instructure.created_by_name
    fill_in "Email", with: @instructure.email
    fill_in "Gender", with: @instructure.gender
    fill_in "Handphone number", with: @instructure.handphone_number
    fill_in "Join date", with: @instructure.join_date
    fill_in "Name", with: @instructure.name
    fill_in "Province", with: @instructure.province
    fill_in "Status", with: @instructure.status
    fill_in "Updated by", with: @instructure.updated_by
    fill_in "Updated by name", with: @instructure.updated_by_name
    fill_in "User", with: @instructure.user_id
    click_on "Update Instructure"

    assert_text "Instructure was successfully updated"
    click_on "Back"
  end

  test "should destroy Instructure" do
    visit instructure_url(@instructure)
    click_on "Destroy this instructure", match: :first

    assert_text "Instructure was successfully destroyed"
  end
end
