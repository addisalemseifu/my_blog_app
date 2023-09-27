Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show, :new] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new,:index, :show, :create]
      resources :likes, only: [:create]
    end
  end
end
