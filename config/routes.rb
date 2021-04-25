Rails.application.routes.draw do

  devise_for :users
  root to: 'prototypes#index'
  get 'prototypes/index'
  get 'prototypes/new', to: 'prototypes#new'
  # get 'prototypes/id', to: 'prototypes#show'
  # get   'users/:id',to:  'users#show'
  resources :users,only: [:edit, :update, :new,:show]
  resources :prototypes,only: [:create,:show,:edit,:update,:destroy] do
    resources :comments, only: [:create,:show]
  end
end
