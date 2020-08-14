Rails.application.routes.draw do  

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'sessions#home'

  get 'auth/:provider/callback', to: 'sessions#google'
  get 'auth/failure', to: redirect('/')

  resources :categories, except: [:edit, :update, :destroy] do 
    resources :dreams, only: [:index]
  end
  
  resources :interpretations

  resources :dreams do 
    resources :interpretations
  end
  
  resources :users do 
    resources :dreams
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
