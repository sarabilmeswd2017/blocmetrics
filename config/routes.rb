Rails.application.routes.draw do
  devise_for :users
  resources :registered_applications
  authenticated :user do
    root 'registered_applications#index', as: :authenticated_root
  end
  root to: 'home#index'
end
