Velican::Application.routes.draw do
  # Admin panel
  namespace :admin do
    resources :products do
      post :add_image, on: :member
      delete :destroy_image, on: :collection
    end
    resources :orders do
      delete :remove_line_item, on: :member
      put :done_order, on: :member
    end
  end

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :update]
  resource :main, only: :show

  match "/pages/*id" => 'pages#show', :as => :page, :format => false

  match '/cart/remote_cart.json' => 'carts#remote_cart'
  match '/cart/add_to_cart' => 'carts#add_to_cart', :via => :put
  match '/cart/update_line_item' => 'carts#update_line_item', :via => :put
  match '/cart/destroy_order' => 'carts#destroy_order', :via => :delete, :as => :destroy_order
  match '/cart/remove_line_item' => 'carts#remove_line_item', :via => :delete, :as => :remove_line_item

  root to: 'mains#index'
end
