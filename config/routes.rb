Rails.application.routes.draw do
  devise_for :users
  root to: "works#index"
  resources :users, only: [:edit, :update]
  resources :works, omly: [:index]
end
