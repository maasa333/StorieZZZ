Rails.application.routes.draw do  

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'sessions#home'

  get '/auth/google_oauth2/callback', to: 'sessions#google'

  resources :categories, only: [:new, :create] #do 
  #   resources :dreams
  # end
  
  resources :interpretations

  resources :dreams do 
    resources :interpretations
  end
  
  resources :users do 
    resources :dreams
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
