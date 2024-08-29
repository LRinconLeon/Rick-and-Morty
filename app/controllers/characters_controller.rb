class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy, :favorite]
  require 'httparty'

  # GET /characters
  def index
    response = HTTParty.get('https://rickandmortyapi.com/api/character')
    api_characters = response.success? ? response.parsed_response['results'] : []

    custom_characters = Character.all

    render json: { api_characters: api_characters, custom_characters: custom_characters }
  end

  # GET /characters/:id
  def show
    render json: @character
  end

  # GET /characters/:id/external
  def show_external
    response = HTTParty.get("https://rickandmortyapi.com/api/character/#{params[:id]}")
    if response.success?
      render json: response.parsed_response
    else
      render json: { error: 'Personaje no encontrado en la API externa' }, status: :not_found
    end
  end

  # POST /characters
  def create
    @character = Character.new(character_params)
    if @character.save
      render json: @character, status: :created
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PUT /characters/:id
  def update
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/:id
  def destroy
    @character.destroy
    head :no_content
  end

  # POST /characters/:id/favorite
  def favorite
    current_user = User.find(params[:user_id]) # Ajusta esto según tu lógica de autenticación
    if current_user.characters.include?(@character)
      render json: { error: 'El personaje ya es favorito' }, status: :unprocessable_entity
    else
      current_user.characters << @character
      render json: { message: 'Personaje marcado como favorito' }, status: :ok
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :status, :species, :gender, :origin, :image)
  end
end
