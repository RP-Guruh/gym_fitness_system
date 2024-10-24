class DashboardController < ApplicationController
  def index
    @employee_check = Employee.where(user_id: current_user.id)
    @member_check = Member.where(user_id: current_user.id)
    @instructure_check = Instructure.where(user_id: current_user.id)

    puts @member_check
  end
end
