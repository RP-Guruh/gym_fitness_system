class MembershipPackagesController < ApplicationController
  before_action :set_membership_package, only: %i[ show edit update destroy ]
  include Pagy::Backend
  before_action -> { check_policy(MembershipPackage) }, only: [:show, :edit, :new, :destroy]

  # GET /membership_packages or /membership_packages.json
  def index
    membership_package_scope = policy_scope(MembershipPackage)

    @q = membership_package_scope.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @membership_packages = @q.result(distinct: true)
    unless @membership_packages.empty?
      @pagy, @membership_packages = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /membership_packages/1 or /membership_packages/1.json
  def show
  end

  # GET /membership_packages/new
  def new
    @membership_package = MembershipPackage.new
    set_status
  end

  # GET /membership_packages/1/edit
  def edit
    set_status
  end

  # POST /membership_packages or /membership_packages.json
  def create
    @membership_package = MembershipPackage.new(membership_package_params)
    @membership_package.current_user = current_user
    respond_to do |format|
      if @membership_package.save
        format.html { redirect_to membership_package_url(@membership_package), notice: "Membership package was successfully created." }
        format.json { render :show, status: :created, location: @membership_package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membership_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membership_packages/1 or /membership_packages/1.json
  def update
    @membership_package.current_user = current_user
    respond_to do |format|
      if @membership_package.update(membership_package_params)
        format.html { redirect_to membership_package_url(@membership_package), notice: "Membership package was successfully updated." }
        format.json { render :show, status: :ok, location: @membership_package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membership_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_packages/1 or /membership_packages/1.json
  def destroy
    @membership_package.destroy!

    respond_to do |format|
      format.html { redirect_to membership_packages_url, notice: "Membership package was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_membership_package
    @membership_package = MembershipPackage.find(params[:id])
  end

  def set_status
    @status = [
      ["Active", "Y"],
      ["Not Active", "N"],
    ]
  end

  # Only allow a list of trusted parameters through.
  def membership_package_params
    params.require(:membership_package).permit(:name, :description, :price, :duration, :status)
  end
end
