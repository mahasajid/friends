Rails.application.routes.draw do
  root 'home#index'
  #devise_for :accounts
  #devise_for :users
  resources :friends

  get 'home/about'
  get '/articles', to: 'articles#index'
  get 'friends/:id/export.pdf', to: 'friends#downloadpdf'
  get 'friends/:id/download', to: 'friends#downloadpdf'
  devise_for :accounts, :controllers => {  omniauth_callbacks: 'accounts/omniauth_callbacks' }
  get '/auth/facebook/callback', to: 'omniauth_callbacks#facebook'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
