Rails.application.routes.draw do
  devise_for :users
  root 'reserves#index'
  resources :trains, only: [:index, :new, :create]
end
