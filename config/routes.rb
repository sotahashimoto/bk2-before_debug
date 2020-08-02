Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites
    resources :comments
  end
  root 'home#top'
  get 'home/about'

end