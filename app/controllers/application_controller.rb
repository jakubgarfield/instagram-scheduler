class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def check_instagram_account_presence
    unless current_user.instagram_accounts.any?
      flash[:info] = "You need to add your Instagram account first"
      redirect_to new_instagram_account_path
      return false
    end
  end
end
