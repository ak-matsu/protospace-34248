Rails.application.routes.draw do

  devise_for :users
  get 'prototypes/index'
  get 'prototypes/new', to: 'prototypes#new'
  # get   'users/:id',to:  'users#show'
  root to: "prototypes#index"
  resources :users,only: [:edit, :update, :new,:show]
  resources :prototypes,only: [:create,:show,:edit,:update,:destroy] do
    resources :comments, only: :create
  end
end
