Rails.application.routes.draw do
  resources :menus
  root to: 'visitors#index'
  resources :roles
  resources :users do
    collection do
      get 'edit_profile'
      patch 'update_profile'
    end
  end
  devise_for :users, path: 'sessions'
end
