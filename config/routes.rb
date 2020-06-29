Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/search', to: 'pages#search', as: :home_search
  get '/passer-premium', to: 'pages#premium'
  get '/subscribe-premium', to: 'pages#subscribe_premium'

  resources :flats do
    resources :chatrooms, only: :create
  end
  resources :profiles, only: :show

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
end
