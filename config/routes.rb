Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  resources :texts, only: [:index, :show]

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :texts, except: [:new, :edit, :create]
  end
end
