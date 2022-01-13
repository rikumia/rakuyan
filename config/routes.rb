Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:index,:edit, :update]
  resources :works
  resources :cliants
  resources :costs, only: [:index, :new, :create, :edit, :update]
  resources :cost_pdfs, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      get 'prawn'
    end
  end
end
