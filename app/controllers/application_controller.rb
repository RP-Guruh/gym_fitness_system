class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def check_policy(resource)
    authorize resource
  end

  def load_regencies
    @regencies = Regency.where(province_id: params[:province_id])
    @my_model = params[:model_id]

    respond_to do |format|
      format.turbo_stream { render partial: "partials/load_regencies" }
      #format.json { render json: @regencies }
      #format.all { render json: { error: "Format not supported" }, status: :not_acceptable } # Menangani format yang tidak dikenal
    end
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = "You are not allowed to perform this action."
    redirect_to dashboard_path
  end
end
