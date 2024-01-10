Rails.application.routes.draw do
  root to: "users#home"

  devise_for :users

  resources :users, only: [:home]
  resources :groups, only: [:index, :show, :new], path: "categories" do
    resources :purchases, only: [:index, :show, :new], :path => "purchases"
  end
end
