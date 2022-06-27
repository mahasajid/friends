Rails.application.routes.draw do
  devise_for :accounts
  #devise_for :users
  resources :friends

  get 'home/about'
  get '/articles', to: 'articles#index'
  get 'friends/:id/export.pdf', to: 'friends#downloadpdf'
  get 'friends/:id/download', to: 'friends#downloadpdf'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
