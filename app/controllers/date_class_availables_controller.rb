class DateClassAvailablesController < ApplicationController
  before_action :set_date_class_available, only: %i[ show edit update destroy ]

  # GET /date_class_availables or /date_class_availables.json
  def index
    @date_class_availables = DateClassAvailable.all
  end

  # GET /date_class_availables/1 or /date_class_availables/1.json
  def show
  end

  # GET /date_class_availables/new
  def new
    @date_class_available = DateClassAvailable.new
  end

  # GET /date_class_availables/1/edit
  def edit
  end

  # POST /date_class_availables or /date_class_availables.json
  def create
    @date_class_available = DateClassAvailable.new(date_class_available_params)

    respond_to do |format|
      if @date_class_available.save
        format.html { redirect_to date_class_available_url(@date_class_available), notice: "Date class available was successfully created." }
        format.json { render :show, status: :created, location: @date_class_available }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @date_class_available.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_class_availables/1 or /date_class_availables/1.json
  def update
    respond_to do |format|
      if @date_class_available.update(date_class_available_params)
        format.html { redirect_to date_class_available_url(@date_class_available), notice: "Date class available was successfully updated." }
        format.json { render :show, status: :ok, location: @date_class_available }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @date_class_available.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_class_availables/1 or /date_class_availables/1.json
  def destroy
    @date_class_available.destroy!

    respond_to do |format|
      format.html { redirect_to date_class_availables_url, notice: "Date class available was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_class_available
      @date_class_available = DateClassAvailable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def date_class_available_params
      params.require(:date_class_available).permit(:available_date, :note, :ClassPackage_id)
    end
end
