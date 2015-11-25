CarTracker::Application.routes.draw do
  root to: 'cars#index'
  resources :cars do
      resources :reservations
  end
  resources :drivers, except:[:destroy] do
    resources :reservations
  end
end
