class MembersController < ApplicationController
  include Pagy::Backend
  before_action -> { check_policy(Member) }, only: [:show, :edit, :new, :destroy]
  before_action :set_status, :set_gender, :set_membership_package, :set_province, :set_cities, only: [:new, :edit]
  # GET /members or /members.json
  def index
    members_scope = policy_scope(Member)

    @q = members_scope.ransack(params[:q])
    @q.sorts = "created_at desc" if @q.sorts.empty?
    @members = @q.result(distinct: true)
    unless @members.empty?
      @pagy, @members = pagy(@q.result(distinct: true), items: 10)
    end
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @accounts = User.all
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to member_url(@member), notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def member_params
    params.require(:member).permit(:name, :users_id, :email, :handphone_number, :gender, :address, :province, :membership_start_date, :membership_end_date, :status, :membership_package_id)
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

  def set_membership_package
    @package = MembershipPackage.all
  end

  def set_status
    @status = [
      ["Active", "Y"],
      ["Not Active", "N"],
    ]
  end
end
