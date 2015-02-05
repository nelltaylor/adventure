Rails.application.routes.draw do

  resources :users
  resources :posts
  resources :comments
  resources :tags

  root 'posts#index'

end
