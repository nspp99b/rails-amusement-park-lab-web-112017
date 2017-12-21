Rails.application.routes.draw do
  root :to => 'attractions#index'
  resources :rides
  resources :attractions
  resources :users
end
