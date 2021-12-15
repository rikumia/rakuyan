Rails.application.routes.draw do
  devise_for :users
  get 'works/index'
  root to: "works#index"
end
