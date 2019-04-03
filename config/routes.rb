Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/skillrgst', to: 'skills#new'
  post '/skillrgst', to: 'skills#create'
  resources :users
  resources :skills
end
