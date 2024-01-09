Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users

  resources :groups
  resources :purchases
  resources :users
end
