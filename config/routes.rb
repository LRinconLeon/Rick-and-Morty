Rails.application.routes.draw do
  get 'characters/index'
  get 'characters/show'
  get 'characters/create'
  get 'characters/update'
  get 'characters/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/index'
  # Ruta de inicio
  root to: 'home#index'

  # Ruta para login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Rutas para usuarios
  resources :users, only: [:index, :show, :create, :update, :destroy]
  # Rutas para personajes
  resources :characters
end
