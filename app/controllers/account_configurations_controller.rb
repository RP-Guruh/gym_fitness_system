class AccountConfigurationsController < ApplicationController
  include Pagy::Backend
  include ApplicationHelper

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

    if user.role_id == 1 || user.role_id == 2 # Jika role 1 owner || Jika role 2 admin
      @profile = Employee.where("user_id", user.id)
    elsif user.role_id == 3 # Jika role 3 instruktur
      @profile = Instructure.where("user_id", user.id)
    elsif user.role_id == 4 # Jika role 4 member
      @profile = Member.where("user_id", user.id)
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

  def user_params
    params.require(:user).permit(:email, :password, :role_id)
  end
end
