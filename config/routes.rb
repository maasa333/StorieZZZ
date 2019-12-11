Rails.application.routes.draw do
  resources :categories, only: [:new, :create]

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'sessions#home'
  
  # resources :sessions, only: [:home, :new, :create, :destroy]
  
  resources :interpretations
  
  resources :dreams do 
    resources :interpretations
  end
  
  resources :users do 
    resources :dreams
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
