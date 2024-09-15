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

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = "You are not allowed to perform this action."
    redirect_to dashboard_path
  end
end
