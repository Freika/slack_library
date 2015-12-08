Rails.application.routes.draw do
  resources :books do
    resources :book_files, only: [:create, :update, :destroy]
    post 'new/isbn', to: 'books#get_book', as: 'get_book', on: :collection
  end
  resources :authors
  root to: 'books#index'
  # root to: 'main#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
