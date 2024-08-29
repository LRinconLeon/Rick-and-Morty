require_relative "boot"

require "rails/all"
require 'rack/cors'  # Asegúrate de requerir rack-cors

Bundler.require(*Rails.groups)

module Rickandmorty
  class Application < Rails::Application
    config.load_defaults 7.1
    config.api_only = true

    # Configuración de CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # Cambia '*' a tu dominio en producción para mayor seguridad
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  end
end
