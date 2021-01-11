Rails.application.routes.draw do
  devise_for :users
  root 'reserves#index'

  # resouces :reserves
end
