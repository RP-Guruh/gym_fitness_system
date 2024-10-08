class EmployeesController < ApplicationController
  include Pagy::Backend
  before_action :set_employee, only: %i[show edit update destroy]
  before_action -> { check_policy(Employee) }, only: [:show, :edit, :new, :destroy]
  # GET /employees or /employees.json
  def index
    employees_scope = policy_scope(Employee)

    @q = employees_scope.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @employees = @q.result(distinct: true)
    unless @employees.empty?
      @pagy, @employees = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /employees/1 or /employees/1.json
  def show
    get_master_data
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @accounts = User.all
    get_master_data
  end

  # GET /employees/1/edit
  def edit
    @accounts = User.all
    get_master_data
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)
    @employee.current_user = current_user
    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    @employee.current_user = current_user
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy!
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:employee_photo, :first_name, :last_name, :user_id, :date_of_birth, :gender, :address, :email, :hire_date, :job_title)
  end

  def get_master_data
    @genders = [["Laki-Laki", "L"], ["Perempuan", "P"]]
    @positions = [
      ["Receptionist", "receptionist"],
      ["Owner", "owner"],
      ["Cashier", "cashier"],
    ]
  end
end
