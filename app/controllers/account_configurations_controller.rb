class AccountConfigurationsController < ApplicationController
  include Pagy::Backend
  include ApplicationHelper
  before_action :set_cities, :set_gender, :set_province, :set_membership_package, :set_status, only: [:change_profile_and_password]

  def index
    @q = User.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @users = @q.result(distinct: true)
    if @users.empty?
    else
      @pagy, @users = pagy(@q.result(distinct: true), items: 10)
    end
  end

  def new
    @user = User.new
    @roles = Role.all
  end

  def edit
    @user = User.new
    @roles = Role.all
  end

  def change_profile_and_password
    user = User.find(params[:id])

    case user.role_id
    when 1, 2
      @employee = Employee.where(user_id: user.id)
      render "profile_employee"
    when 3
      @instructure = Instructure.where(user_id: user.id)
      render "profile_instructure"
    when 4
      @member = Member.where(user_id: user.id)
      @accounts = User.where(role_id: 4)
      render "profile_member"
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/account_configurations", notice: "Account was successfully created." }
        format.json { render json: { message: "Account was successfully created.", user: @user }, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def generate_new_password
    @new_password = SecureRandom.hex(7)
    render json: {
      success: true,
      message: "Success generate new password",
      password: @new_password,
    }
  end

  private

  def set_gender
    @genders = [["Laki-Laki", "L"], ["Perempuan", "P"]]
  end

  def set_province
    @province = Province.all
  end

  def set_cities
    @cities = Regency.all
  end

  def set_membership_package
    @package = MembershipPackage.all
  end

  def set_status
    @status = [
      ["Active", "Y"],
      ["Not Active", "N"],
    ]
  end

  def user_params
    params.require(:user).permit(:email, :password, :role_id)
  end
end
