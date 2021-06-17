Rails.application.routes.draw do
  get 'yoga_records/index'
  get 'yoga_records/new'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'posts#index'
  post '/users/guest_sign_in', to: 'users#guest_sign_in'
  resources :posts do
    resources :comments
  end
  
  resources :favorites, only: [:create, :destroy, :show]
  resources :users, only: [:index] 
  resources :relationships, only: [:create, :destroy]
 end

