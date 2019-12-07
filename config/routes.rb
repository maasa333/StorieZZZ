Rails.application.routes.draw do
  # get 'sessions/home'
  # get 'sessions/new'
  # get 'sessions/create'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'sessions#home'
  
  resources :sessions, only: [:home, :new, :create, :destroy]
  resources :interpretations
  resources :dreams
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
