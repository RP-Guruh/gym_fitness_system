class InstructuresController < ApplicationController
  include Pagy::Backend

  before_action :set_instructure, only: %i[ show edit update destroy ]
  before_action -> { check_policy(Instructure) }, only: [:show, :edit, :new, :destroy]
  before_action :set_status, :set_gender, :set_province, :set_cities, only: [:new, :edit, :show]
  before_action :get_account, only: [:edit, :new, :show]

  # GET /instructures or /instructures.json
  def index
    instructures_scope = policy_scope(Instructure)

    @q = instructures_scope.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @instructures = @q.result(distinct: true)
    unless @instructures.empty?
      @pagy, @meinstructuresmbers = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /instructures/1 or /instructures/1.json
  def show
  end

  # GET /instructures/new
  def new
    @instructure = Instructure.new
  end

  # GET /instructures/1/edit
  def edit
  end

  # POST /instructures or /instructures.json
  def create
    @instructure = Instructure.new(instructure_params)
    @instructure.current_user = current_user
    respond_to do |format|
      if @instructure.save
        format.html { redirect_to instructure_url(@instructure), notice: "Instructure was successfully created." }
        format.json { render :show, status: :created, location: @instructure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instructure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructures/1 or /instructures/1.json
  def update
    @instructure.current_user = current_user
    respond_to do |format|
      if @instructure.update(instructure_params)
        format.html { redirect_to instructure_url(@instructure), notice: "Instructure was successfully updated." }
        format.json { render :show, status: :ok, location: @instructure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instructure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructures/1 or /instructures/1.json
  def destroy
    @instructure.destroy!

    respond_to do |format|
      format.html { redirect_to instructures_url, notice: "Instructure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instructure
    @instructure = Instructure.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def instructure_params
    params.require(:instructure).permit(:name, :user_id, :email, :handphone_number, :gender, :address, :city, :province, :join_date, :status, :created_by, :created_by_name, :updated_by, :updated_by_name, :instructure_photo)
  end

  def set_gender
    @genders = [["Laki-Laki", "L"], ["Perempuan", "P"]]
  end

  def set_province
    @province = Province.all
  end

  def set_cities
    @cities = Regency.all
  end

  def set_status
    @status = [
      ["Active", "Y"],
      ["Not Active", "N"],
    ]
  end

  def get_account
    @accounts = User.where(role_id: 3)
  end
end
