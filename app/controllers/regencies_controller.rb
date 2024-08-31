class RegenciesController < ApplicationController
  include Pagy::Backend
  before_action :set_regency, only: %i[ show edit update destroy ]

  # GET /regencies or /regencies.json
  def index
    @q = Regency.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @regencies = @q.result(distinct: true)
    if @regencies.empty?
    else
      @pagy, @regencies = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /regencies/1 or /regencies/1.json
  def show
  end

  # GET /regencies/new
  def new
    @regency = Regency.new
    @province = get_province
  end

  # GET /regencies/1/edit
  def edit
    @province = get_province
  end

  # POST /regencies or /regencies.json
  def create
    @regency = Regency.new(regency_params)
    @regency.current_user = current_user
    respond_to do |format|
      if @regency.save
        format.html { redirect_to regency_url(@regency), notice: "Regency was successfully created." }
        format.json { render :show, status: :created, location: @regency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @regency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regencies/1 or /regencies/1.json
  def update
    @regency.current_user = current_user
    respond_to do |format|
      if @regency.update(regency_params)
        format.html { redirect_to regency_url(@regency), notice: "Regency was successfully updated." }
        format.json { render :show, status: :ok, location: @regency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @regency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regencies/1 or /regencies/1.json
  def destroy
    @regency.destroy!

    respond_to do |format|
      format.html { redirect_to regencies_url, notice: "Regency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_province
    @data = Province.order(:name).all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_regency
    @regency = Regency.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def regency_params
    params.require(:regency).permit(:name, :province_id)
  end
end
