Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  post '/users/guest_sign_in', to: 'users#guest_sign_in'
  resources :posts
 end

