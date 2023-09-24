Rails.application.routes.draw do
  # get 'likes/index'
  # get 'likes/show'
  # get 'likes/new'
  # get 'likes/edit'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # get 'comments/index'
  # get 'comments/show'
  # get 'comments/new'
  # get 'comments/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  get '/', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'posts#index'
  get '/users/:id/posts/:id', to: 'posts#show'
end
