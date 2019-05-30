Rails.application.routes.draw do

  # We put the root page to the events index
  root to: 'items#index'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :profile_pictures, only:[:create]
  end

  resources :items, only: [:index, :show]
  resources :carts, only: [:show, :update]
  resources :orders, only: [:create]
  resources :cart_items, only: [:create, :destroy]
  resources :charges, only: [:new, :create]

  # For the controller to be found, first declare the admins controller
  # before namespace declaration
  resources :admins, only: [:index]

  # Admin dashboard
  namespace :admins do
    root to: "admins#index"
    resources :users, only: [:index]
    resources :items, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  end
end


