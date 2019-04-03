Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/skill', to: 'skills#new'
  patch '/skill', to: 'skills#add'
  patch '/skilldel', to: 'skills#destroy'
  resources :users
  resources :skills
end
