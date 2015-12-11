Rails.application.routes.draw do
  resources :books do
    resources :book_files, only: [:create, :update, :destroy]
    post 'new/isbn', to: 'books#get_book', as: 'get_book', on: :collection
    post 'comment', on: :member
    post 'get_google_books', on: :member
    post 'get_goodreads', on: :member
  end
  resources :categories
  resources :authors, only: [:index, :show]
  root to: 'books#index'
  # root to: 'main#index'
  get 'users', to: 'users#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
