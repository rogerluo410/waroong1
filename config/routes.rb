Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
      resources :orders
      resources :order_items
      resources :order_statuses
      resources :products
      resources :product_categories
      root to: "orders#index"
  end

  resources :charges
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:index, :show]
  resources :addresses

  get '/category/:id',  to: 'product_categories#show', as: "category"
  root to: "products#index"

  match '*unmatched', to: 'application#route_not_found', via: :all, constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
  
end