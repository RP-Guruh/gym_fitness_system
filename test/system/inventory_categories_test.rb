require "application_system_test_case"

class InventoryCategoriesTest < ApplicationSystemTestCase
  setup do
    @inventory_category = inventory_categories(:one)
  end

  test "visiting the index" do
    visit inventory_categories_url
    assert_selector "h1", text: "Inventory categories"
  end

  test "should create inventory category" do
    visit inventory_categories_url
    click_on "New inventory category"

    fill_in "Description", with: @inventory_category.description
    fill_in "Name", with: @inventory_category.name
    click_on "Create Inventory category"

    assert_text "Inventory category was successfully created"
    click_on "Back"
  end

  test "should update Inventory category" do
    visit inventory_category_url(@inventory_category)
    click_on "Edit this inventory category", match: :first

    fill_in "Description", with: @inventory_category.description
    fill_in "Name", with: @inventory_category.name
    click_on "Update Inventory category"

    assert_text "Inventory category was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory category" do
    visit inventory_category_url(@inventory_category)
    click_on "Destroy this inventory category", match: :first

    assert_text "Inventory category was successfully destroyed"
  end
end
