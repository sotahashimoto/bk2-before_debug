Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'

  get "search" => "search#search"

end