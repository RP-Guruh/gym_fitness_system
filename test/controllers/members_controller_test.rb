require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference("Member.count") do
      post members_url, params: { member: { address: @member.address, email: @member.email, emergency_phone_name: @member.emergency_phone_name, emergency_phone_number: @member.emergency_phone_number, emergency_phone_status: @member.emergency_phone_status, gender: @member.gender, handphone_number: @member.handphone_number, membership_end_date: @member.membership_end_date, membership_package_id: @member.membership_package_id, membership_start_date: @member.membership_start_date, name: @member.name, province: @member.province, status: @member.status, users_id: @member.users_id } }
    end

    assert_redirected_to member_url(Member.last)
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { address: @member.address, email: @member.email, emergency_phone_name: @member.emergency_phone_name, emergency_phone_number: @member.emergency_phone_number, emergency_phone_status: @member.emergency_phone_status, gender: @member.gender, handphone_number: @member.handphone_number, membership_end_date: @member.membership_end_date, membership_package_id: @member.membership_package_id, membership_start_date: @member.membership_start_date, name: @member.name, province: @member.province, status: @member.status, users_id: @member.users_id } }
    assert_redirected_to member_url(@member)
  end

  test "should destroy member" do
    assert_difference("Member.count", -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end
