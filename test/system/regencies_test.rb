require "application_system_test_case"

class RegenciesTest < ApplicationSystemTestCase
  setup do
    @regency = regencies(:one)
  end

  test "visiting the index" do
    visit regencies_url
    assert_selector "h1", text: "Regencies"
  end

  test "should create regency" do
    visit regencies_url
    click_on "New regency"

    fill_in "Created by", with: @regency.created_by
    fill_in "Created by name", with: @regency.created_by_name
    fill_in "Name", with: @regency.name
    fill_in "Updated by", with: @regency.updated_by
    fill_in "Updated by name", with: @regency.updated_by_name
    click_on "Create Regency"

    assert_text "Regency was successfully created"
    click_on "Back"
  end

  test "should update Regency" do
    visit regency_url(@regency)
    click_on "Edit this regency", match: :first

    fill_in "Created by", with: @regency.created_by
    fill_in "Created by name", with: @regency.created_by_name
    fill_in "Name", with: @regency.name
    fill_in "Updated by", with: @regency.updated_by
    fill_in "Updated by name", with: @regency.updated_by_name
    click_on "Update Regency"

    assert_text "Regency was successfully updated"
    click_on "Back"
  end

  test "should destroy Regency" do
    visit regency_url(@regency)
    click_on "Destroy this regency", match: :first

    assert_text "Regency was successfully destroyed"
  end
end
