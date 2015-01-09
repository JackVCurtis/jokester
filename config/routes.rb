Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:show, :index] do 
    resources :friendships, only: [:create, :destroy]
  end

  resources :jokes do
  	resources :comments, except: [:index, :show, :new]
  	resources :votes, only: [:create, :destroy] 
  end
end

