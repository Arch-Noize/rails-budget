Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :groups, only: [:index, :new, :create], path: "categories" do
    resources :purchases, only: [:index, :show, :new, :create]
  end
end
