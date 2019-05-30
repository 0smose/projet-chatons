Rails.application.routes.draw do
  resources :static_pages, only: [:index, :secret]
  resources :carts, only: [:new, :create, :update, :show]
  # We put the root page to the events index
  root to: 'items#index'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
    

  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :profile_pictures, only:[:create]
  end
  resources :items
  resources :carts, only: [:new, :create, :update, :show]
  resources :orders, only: [:new, :create, :update, :show]
  resources :cart_items
  resources :charges

  # For the controller to be found, first declare the admins controller
  # before namespace declaration
  resources :admins, only: [:index]

  # Admin dashboard
  namespace :admins do
    root to: "admins#index"
    resources :users
    resources :items
  end
end


