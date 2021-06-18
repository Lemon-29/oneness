Rails.application.routes.draw do
  get 'yoga_records/index'
  get 'yoga_records/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'top#index'
  post '/users/guest_sign_in', to: 'users#guest_sign_in'
  resources :posts do
    resources :comments
  end
  
  resources :favorites, only: [:create, :destroy]
  resources :users, only: [:index] do 
    resources :favorites, only: [:index]
    resources :posts, only: [:index], controller: 'users/posts'
  end
  resources :relationships, only: [:create, :destroy]
 end

