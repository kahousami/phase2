Rails.application.routes.draw do

  get 'home/about'
  devise_for :users
  resources :books do
  	resources :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update] do
    member do
     get :following, :followers
    end
  end

  root to: 'home#top'

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
