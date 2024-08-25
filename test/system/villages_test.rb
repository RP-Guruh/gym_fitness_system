require "application_system_test_case"

class VillagesTest < ApplicationSystemTestCase
  setup do
    @village = villages(:one)
  end

  test "visiting the index" do
    visit villages_url
    assert_selector "h1", text: "Villages"
  end

  test "should create village" do
    visit villages_url
    click_on "New village"

    fill_in "Created by", with: @village.created_by
    fill_in "Created by name", with: @village.created_by_name
    fill_in "Name", with: @village.name
    fill_in "Updated by", with: @village.updated_by
    fill_in "Updated by name", with: @village.updated_by_name
    click_on "Create Village"

    assert_text "Village was successfully created"
    click_on "Back"
  end

  test "should update Village" do
    visit village_url(@village)
    click_on "Edit this village", match: :first

    fill_in "Created by", with: @village.created_by
    fill_in "Created by name", with: @village.created_by_name
    fill_in "Name", with: @village.name
    fill_in "Updated by", with: @village.updated_by
    fill_in "Updated by name", with: @village.updated_by_name
    click_on "Update Village"

    assert_text "Village was successfully updated"
    click_on "Back"
  end

  test "should destroy Village" do
    visit village_url(@village)
    click_on "Destroy this village", match: :first

    assert_text "Village was successfully destroyed"
  end
end
