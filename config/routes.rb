Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  root 'posts#index'
  resources :posts
 end

