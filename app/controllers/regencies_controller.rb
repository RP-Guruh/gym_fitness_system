class RegenciesController < ApplicationController
  before_action :set_regency, only: %i[ show edit update destroy ]

  # GET /regencies or /regencies.json
  def index
    @regencies = Regency.all
  end

  # GET /regencies/1 or /regencies/1.json
  def show
  end

  # GET /regencies/new
  def new
    @regency = Regency.new
  end

  # GET /regencies/1/edit
  def edit
  end

  # POST /regencies or /regencies.json
  def create
    @regency = Regency.new(regency_params)

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
    # Use callbacks to share common setup or constraints between actions.
    def set_regency
      @regency = Regency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def regency_params
      params.require(:regency).permit(:name, :created_by, :created_by_name, :updated_by, :updated_by_name)
    end
end
