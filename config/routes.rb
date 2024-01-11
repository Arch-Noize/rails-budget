Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :groups, only: [:index, :show, :new, :create], path: "categories" do
    resources :purchases, only: [:index, :show, :new], :path => "purchases"
  end
end
