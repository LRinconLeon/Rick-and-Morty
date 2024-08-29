class CharactersController < ApplicationController
  # GET /characters
  def index
    @characters = Character.all
    render json: @characters
  end

  # GET /characters/:id
  def show
    @character = Character.find(params[:id])
    render json: @character
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
    @character = Character.find(params[:id])
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/:id
  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    head :no_content
  end

  private

  # Solo permitir una lista de parámetros confiables a través de.
  def character_params
    params.require(:character).permit(:name, :status, :species, :gender, :origin, :image)
  end
end
