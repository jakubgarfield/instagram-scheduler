Rails.application.routes.draw do
  resources :instagram_accounts, path: :accounts do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  get "pricing", to: "home#pricing"

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root "home#index", as: :authenticated_root
    end

    unauthenticated do
      root "home#landing_page", as: :unauthenticated_root
    end
  end
end
