CarTracker::Application.routes.draw do
  root to: 'cars#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :cars do
      resources :reservations
      resources :notifications
  end
  resources :drivers, except:[:destroy] do
    resources :reservations
    resources :notifications
  end
end
