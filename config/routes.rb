Rails.application.routes.draw do
  resources :texts, only: [:create]
end
