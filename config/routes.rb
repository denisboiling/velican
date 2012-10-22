Velican::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resource :main, only: :show

  root to: 'mains#index'
end
