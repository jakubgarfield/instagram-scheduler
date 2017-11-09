class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:pricing, :landing_page]

  def index
    if current_user.instagram_accounts.any?
      last_post = current_user.posts.last
      last_account = last_post ? last_post.instagram_account : current_user.instagram_accounts.last

      redirect_to instagram_account_path(last_account)
    else
      flash[:info] = "You need to add your Instagram account first"
      redirect_to new_instagram_account_path
    end
  end

  def pricing
  end

  def landing_page
  end
end
