require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count") do
      post employees_url, params: { employee: { address: @employee.address, created_by: @employee.created_by, created_by_name: @employee.created_by_name, date_of_birth: @employee.date_of_birth, email: @employee.email, employee_id: @employee.employee_id, first_name: @employee.first_name, gender: @employee.gender, hire_date: @employee.hire_date, job_title: @employee.job_title, last_name: @employee.last_name, photo: @employee.photo, photo_extension: @employee.photo_extension, photo_size: @employee.photo_size, updated_by: @employee.updated_by, updated_by_name: @employee.updated_by_name, user_id: @employee.user_id } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { address: @employee.address, created_by: @employee.created_by, created_by_name: @employee.created_by_name, date_of_birth: @employee.date_of_birth, email: @employee.email, employee_id: @employee.employee_id, first_name: @employee.first_name, gender: @employee.gender, hire_date: @employee.hire_date, job_title: @employee.job_title, last_name: @employee.last_name, photo: @employee.photo, photo_extension: @employee.photo_extension, photo_size: @employee.photo_size, updated_by: @employee.updated_by, updated_by_name: @employee.updated_by_name, user_id: @employee.user_id } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
