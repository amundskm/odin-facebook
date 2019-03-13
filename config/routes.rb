Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts
end
