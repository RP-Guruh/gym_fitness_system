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
      @employee = Employee.where(user_id: user.id).first
      set_gender
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

  def update_profil
    update_type = params[:employee][:type]

    puts "halo #{update_type}"
    case update_type
    when "employee"
      @employee = Employee.find(params[:id])

      respond_to do |format|
        if @employee.update(employee_params)
          format.html { redirect_to "/profile/#{@employee.id}", notice: "Employee was successfully updated." }
          format.json { render :show, status: :ok, location: @employee }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    when "member"
    when "instructur"
    end
  end

  def update_password
    @user = User.find(params[:profil][:id])
    old_password = params[:profil][:old_password]
    new_password = params[:profil][:password]
    password_confirmation = params[:profil][:confirm_password]

    if @user.valid_password?(old_password)
      if new_password == password_confirmation
        if @user.update(password: new_password)
          sign_out(@user)
          flash[:success] = "Password berhasil diperbarui! Silakan login kembali."
          respond_to do |format|
            format.html { redirect_to new_user_session_path }
            format.json { render json: { message: "Password berhasil diperbarui!" }, status: :ok }
          end
        else
          render_error("Gagal memperbarui password. Pastikan password baru memenuhi semua kriteria.")
        end
      else
        render_error("Password baru dan konfirmasi tidak cocok.")
      end
    else
      render_error("Password lama tidak valid.")
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

  def employee_params
    params.require(:employee).permit(:employee_photo, :first_name, :last_name, :user_id, :date_of_birth, :gender, :address, :email)
  end

  def password_params
    params.require(:user).permit(:password)
  end

  def render_error(message)
    flash.now[:error] = message
    respond_to do |format|
      format.html { render_profile_view } # Render HTML view based on role
      format.json { render json: { error: message }, status: :unprocessable_entity }
    end
  end

  def render_profile_view
    case @user.role_id
    when 1, 2
      @employee = Employee.find_by(user_id: @user.id)
      set_gender
      render "profile_employee" # Ensure this view exists
    when 3
      @instructure = Instructure.where(user_id: @user.id)
      render "profile_instructure" # Ensure this view exists
    when 4
      @member = Member.where(user_id: @user.id)
      @accounts = User.where(role_id: 4)
      render "profile_member" # Ensure this view exists
    else
      flash[:error] = "Role tidak dikenali."
      redirect_to root_path # Redirect if role not recognized
    end
  end
end
