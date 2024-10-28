class ClassPackagesController < ApplicationController
  include Pagy::Backend
  before_action :set_class_package, only: %i[ show edit update destroy ]
  before_action -> { check_policy(ClassPackage) }, only: [:show, :edit, :new, :destroy]

  # GET /class_packages or /class_packages.json
  def index
    class_packages_scope = policy_scope(ClassPackage)

    @q = class_packages_scope.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @class_packages = @q.result(distinct: true)
    unless @class_packages.empty?
      @pagy, @class_packages = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /class_packages/1 or /class_packages/1.json
  def show
  end

  # GET /class_packages/new
  def new
    @class_package = ClassPackage.new
    @class_package.date_class_availables.build
  end

  # GET /class_packages/1/edit
  def edit
  end

  # POST /class_packages or /class_packages.json
  def create
    @class_package = ClassPackage.new(class_package_params)

    respond_to do |format|
      if @class_package.save
        format.html { redirect_to class_package_url(@class_package), notice: "Class package was successfully created." }
        format.json { render :show, status: :created, location: @class_package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_packages/1 or /class_packages/1.json
  def update
    respond_to do |format|
      if @class_package.update(class_package_params)
        format.html { redirect_to class_package_url(@class_package), notice: "Class package was successfully updated." }
        format.json { render :show, status: :ok, location: @class_package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_packages/1 or /class_packages/1.json
  def destroy
    @class_package.destroy!

    respond_to do |format|
      format.html { redirect_to class_packages_url, notice: "Class package was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_class_package
    @class_package = ClassPackage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def class_package_params
    params.require(:class_package).permit(:name, :description, :trainers_id, :price, :duration, :status, date_class_availables: [
                                                                                                           :id,
                                                                                                           :available_date,
                                                                                                           :note,
                                                                                                           :_destroy,
                                                                                                         ])
  end
end
