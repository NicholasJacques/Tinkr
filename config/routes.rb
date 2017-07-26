Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/facebook', as: 'facebook_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :accounts, only: [:new]
  resources :sessions, only: [:new]
end
