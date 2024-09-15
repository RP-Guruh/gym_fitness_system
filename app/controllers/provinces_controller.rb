class ProvincesController < ApplicationController
  include Pagy::Backend

  before_action :set_province, only: %i[ show edit update destroy ]
  before_action -> { check_policy(Province) }, only: [:show, :edit, :new, :destroy]

  # GET /provinces or /provinces.json
  def index
    province_scope = policy_scope(Province)
    @q = province_scope.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @provinces = @q.result(distinct: true)
    if @provinces.empty?
    else
      @pagy, @provinces = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /provinces/1 or /provinces/1.json
  def show
  end

  # GET /provinces/new
  def new
    @province = Province.new
  end

  # GET /provinces/1/edit
  def edit
  end

  # POST /provinces or /provinces.json
  def create
    @province = Province.new(province_params)
    @province.current_user = current_user

    respond_to do |format|
      if @province.save
        format.html { redirect_to provinces_path, notice: "Province was successfully created." }
        format.json { render :show, status: :created, location: @province }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provinces/1 or /provinces/1.json
  def update
    @province.current_user = current_user
    respond_to do |format|
      if @province.update(province_params)
        format.html { redirect_to provinces_path, notice: "Province was successfully updated." }
        format.json { render :show, status: :ok, location: @province }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provinces/1 or /provinces/1.json
  def destroy
    @province.destroy!

    respond_to do |format|
      format.html { redirect_to provinces_url, notice: "Province was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_province
    @province = Province.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def province_params
    params.require(:province).permit(:name)
  end
end
