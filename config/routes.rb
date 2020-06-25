Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/search', to: 'pages#search', as: :home_search
  resources :flats, only: [:index, :show]
  resources :profiles, only: :show

end
