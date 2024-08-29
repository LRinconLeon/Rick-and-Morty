Rails.application.routes.draw do
  # Rutas para el recurso de usuarios
  resources :users, only: [:create, :show, :update, :destroy] # Puedes ajustar las acciones disponibles según lo necesites
  
  # Rutas para el recurso de personajes
  resources :characters do
    # Ruta adicional para buscar en la API externa
    member do
      get 'external', to: 'characters#show_external'
      post 'favorite', to: 'characters#favorite' # Ruta para marcar un personaje como favorito
    end
  end
  
  # Ruta raíz opcional
  # root 'home#index' # Ajusta esto a tu controlador y acción de inicio
end
