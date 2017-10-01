Rails.application.routes.draw do
  devise_for :users
  resources :registered_applications
  namespace :api, defaults: { format: :json } do
     match '/events', to: 'events#preflight', via: [:options]
     resources :events, only: [:create]
   end
  authenticated :user do
    root 'registered_applications#index', as: :authenticated_root
  end
  root to: 'home#index'
end
