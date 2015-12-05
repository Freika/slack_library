Rails.application.routes.draw do
  resources :books
  resources :authors
  root to: 'main#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
