class PermissionsController < ApplicationController
  include Pagy::Backend
  before_action :set_permission, only: %i[ show edit update destroy ]
  before_action :get_action, only: [:new, :edit]
  before_action :get_resource, only: [:new, :edit]
  before_action :get_role, only: [:new, :edit]

  # GET /permissions or /permissions.json
  def index
    permission_scope = policy_scope(Permission)
    @q = permission_scope.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @permissions = @q.result(distinct: true)

    unless @permissions.empty?
      @pagy, @permissions = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /permissions/1 or /permissions/1.json
  def show
    authorize @permission
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
    authorize @permission
  end

  # GET /permissions/1/edit
  def edit
    authorize @permission
  end

  # POST /permissions or /permissions.json
  def create
    @permission = Permission.new(permission_params)
    @permission.current_user = current_user
    respond_to do |format|
      if @permission.save
        format.html { redirect_to permission_url(@permission), notice: "Permission was successfully created." }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1 or /permissions/1.json
  def update
    @permission.current_user = current_user
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to permission_url(@permission), notice: "Permission was successfully updated." }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1 or /permissions/1.json
  def destroy
    authorize @permission
    @permission.destroy!

    respond_to do |format|
      format.html { redirect_to permissions_url, notice: "Permission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_permission
    @permission = Permission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def permission_params
    params.require(:permission).permit(:action, :resource, :role_id)
  end

  def get_role
    @data = Role.order(:name).all
  end

  def get_action
    @action_list = [
      "read",
      "create",
      "index",
      "edit",
      "destroy",
    ]
  end

  def get_resource
    @resource_list = [
      "Employee",
      "Province",
      "Regency",
      "InventoryCategory",
      "ProductCategory",
      "User",
      "Permission",
      "MembershipPackage",
      "Member",
    ]
  end

  def authorize_access
    if @permission
      authorize @employee
    else
      # Handling jika @permission nil, misal redirect atau raise error
      raise Pundit::NotAuthorizedError, "Permission not found"
    end
  end
end
