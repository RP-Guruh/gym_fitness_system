class InventoryCategoriesController < ApplicationController
  include Pagy::Backend
  before_action :set_inventory_category, only: %i[ show edit update destroy ]

  # GET /inventory_categories or /inventory_categories.json
  def index
    @q = InventoryCategory.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @inventory_categories = @q.result(distinct: true)
    if @inventory_categories.empty?
    else
      @pagy, @inventory_categories = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /inventory_categories/1 or /inventory_categories/1.json
  def show
  end

  # GET /inventory_categories/new
  def new
    @inventory_category = InventoryCategory.new
  end

  # GET /inventory_categories/1/edit
  def edit
  end

  # POST /inventory_categories or /inventory_categories.json
  def create
    @inventory_category = InventoryCategory.new(inventory_category_params)
    @inventory_category.current_user = current_user
    respond_to do |format|
      if @inventory_category.save
        format.html { redirect_to inventory_categories_path, notice: "Inventory category was successfully created." }
        format.json { render :show, status: :created, location: @inventory_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_categories/1 or /inventory_categories/1.json
  def update
    respond_to do |format|
      if @inventory_category.update(inventory_category_params)
        format.html { redirect_to inventory_category_url(@inventory_category), notice: "Inventory category was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_categories/1 or /inventory_categories/1.json
  def destroy
    @inventory_category.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_categories_url, notice: "Inventory category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory_category
    @inventory_category = InventoryCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_category_params
    params.require(:inventory_category).permit(:name, :description)
  end
end
