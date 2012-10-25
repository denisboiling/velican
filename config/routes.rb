Velican::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resource :main, only: :show

  match "/pages/*id" => 'pages#show', :as => :page, :format => false
  root to: 'mains#index'
end
