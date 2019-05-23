Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :comments
  resources :posts
  resources :likes, only: [:create, :destroy]
  resources :users
  resources :friend_requests, only: [:new, :index, :create, :destroy]
  resources :friendships, only: [:new, :create, :destroy]

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
