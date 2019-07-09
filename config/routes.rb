Rails.application.routes.draw do
  resources :roles
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
