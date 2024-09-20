class DashboardController < ApplicationController
  def index
    @employee_check = Employee.where(user_id: current_user.id)
  end
end
