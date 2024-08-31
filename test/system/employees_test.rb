require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Address", with: @employee.address
    fill_in "Created by", with: @employee.created_by
    fill_in "Created by name", with: @employee.created_by_name
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "Email", with: @employee.email
    fill_in "Employee", with: @employee.employee_id
    fill_in "First name", with: @employee.first_name
    fill_in "Gender", with: @employee.gender
    fill_in "Hire date", with: @employee.hire_date
    fill_in "Job title", with: @employee.job_title
    fill_in "Last name", with: @employee.last_name
    fill_in "Photo", with: @employee.photo
    fill_in "Photo extension", with: @employee.photo_extension
    fill_in "Photo size", with: @employee.photo_size
    fill_in "Updated by", with: @employee.updated_by
    fill_in "Updated by name", with: @employee.updated_by_name
    fill_in "User", with: @employee.user_id
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Address", with: @employee.address
    fill_in "Created by", with: @employee.created_by
    fill_in "Created by name", with: @employee.created_by_name
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "Email", with: @employee.email
    fill_in "Employee", with: @employee.employee_id
    fill_in "First name", with: @employee.first_name
    fill_in "Gender", with: @employee.gender
    fill_in "Hire date", with: @employee.hire_date
    fill_in "Job title", with: @employee.job_title
    fill_in "Last name", with: @employee.last_name
    fill_in "Photo", with: @employee.photo
    fill_in "Photo extension", with: @employee.photo_extension
    fill_in "Photo size", with: @employee.photo_size
    fill_in "Updated by", with: @employee.updated_by
    fill_in "Updated by name", with: @employee.updated_by_name
    fill_in "User", with: @employee.user_id
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
