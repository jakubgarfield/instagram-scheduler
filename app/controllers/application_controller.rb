class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_time_zone
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:timezone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:timezone])
  end

  def set_time_zone
    Time.zone = current_user.timezone if current_user
  end

  def check_instagram_account_presence
    unless current_user.instagram_accounts.any?
      flash[:info] = "You need to add your Instagram account first"
      redirect_to new_instagram_account_path
      return false
    end
  end
end
