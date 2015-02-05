Rails.application.routes.draw do

  resources :users
  resources :posts
  resources :comments
  resources :tags

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  root 'posts#index'

  resources :posts

  resources :replies

  resources :tags

  resources :post_tags

  resources :posts

  resources :replies

  resources :tags

  resources :post_tags

end
