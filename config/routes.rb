Rails.application.routes.draw do
  get 'sessions/home'
  get 'sessions/new'
  get 'sessions/create'

  get '/signup', to: 'users#new'

  root 'sessions#home'
  
  resources :interpretations
  resources :dreams
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
