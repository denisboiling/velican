Velican::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resource :main, only: :show
  root to: 'mains#index'
end
