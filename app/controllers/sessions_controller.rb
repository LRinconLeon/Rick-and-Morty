class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: { message: 'Logged in successfully', user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    # Aquí puedes agregar la lógica para cerrar sesión si estás manejando tokens o sesiones
  end
end
