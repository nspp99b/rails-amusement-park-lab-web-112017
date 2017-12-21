Rails.application.routes.draw do
  root :to => 'sessions#new'
  resources :rides
  resources :attractions
  resources :users

  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create", as: "sessions"
  delete "/sessions/delete", to: "sessions#destroy"
end
