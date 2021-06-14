Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'posts#index'
  post '/users/guest_sign_in', to: 'users#guest_sign_in'
  resources :posts
  resources :favorites, only: [:create, :destroy]
 end

