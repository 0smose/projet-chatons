Rails.application.routes.draw do
  resources :static_pages, only: [:index, :secret]

  # We put the root page to the events index
  root to: 'items#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :items
  resources :carts, only: [:new, :create, :update, :show]
  resources :orders, only: [:new, :create, :update, :show]
  resources :cart_items
end
