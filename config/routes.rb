Rails.application.routes.draw do
  get 'cliants/index'
  devise_for :users
  root to: "users#index"
  resources :users, only: [:index,:edit, :update]
  resources :works
  resources :cliants
  resources :costs, only: [:index, :new, :create, :edit, :update]
end
