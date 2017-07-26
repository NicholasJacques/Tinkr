Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/facebook', as: 'facebook_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :accounts, only: [:new]
  resources :sessions, only: [:new]
  namespace :registration do
    resources :cars, only: [:new]
  end

  namespace :api do
    namespace :v1 do
      post 'vin_search', to: 'vin_search#create'
    end
  end
end
