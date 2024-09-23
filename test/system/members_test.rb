require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "should create member" do
    visit members_url
    click_on "New member"

    fill_in "Address", with: @member.address
    fill_in "Email", with: @member.email
    fill_in "Emergency phone name", with: @member.emergency_phone_name
    fill_in "Emergency phone number", with: @member.emergency_phone_number
    fill_in "Emergency phone status", with: @member.emergency_phone_status
    fill_in "Gender", with: @member.gender
    fill_in "Handphone number", with: @member.handphone_number
    fill_in "Membership end date", with: @member.membership_end_date
    fill_in "Membership package", with: @member.membership_package_id
    fill_in "Membership start date", with: @member.membership_start_date
    fill_in "Name", with: @member.name
    fill_in "Province", with: @member.province
    fill_in "Status", with: @member.status
    fill_in "Users", with: @member.users_id
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "should update Member" do
    visit member_url(@member)
    click_on "Edit this member", match: :first

    fill_in "Address", with: @member.address
    fill_in "Email", with: @member.email
    fill_in "Emergency phone name", with: @member.emergency_phone_name
    fill_in "Emergency phone number", with: @member.emergency_phone_number
    fill_in "Emergency phone status", with: @member.emergency_phone_status
    fill_in "Gender", with: @member.gender
    fill_in "Handphone number", with: @member.handphone_number
    fill_in "Membership end date", with: @member.membership_end_date
    fill_in "Membership package", with: @member.membership_package_id
    fill_in "Membership start date", with: @member.membership_start_date
    fill_in "Name", with: @member.name
    fill_in "Province", with: @member.province
    fill_in "Status", with: @member.status
    fill_in "Users", with: @member.users_id
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "should destroy Member" do
    visit member_url(@member)
    click_on "Destroy this member", match: :first

    assert_text "Member was successfully destroyed"
  end
end
