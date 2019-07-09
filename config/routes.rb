Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :roles
  resources :users
  devise_for :users
end
