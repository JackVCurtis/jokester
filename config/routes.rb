Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:show, :index]

  resources :jokes do
  	resources :comments, except: [:index, :show, :new]
  	resources :votes, only: [:create, :destroy] 
  end
end

