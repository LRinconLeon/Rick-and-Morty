class HomeController < ApplicationController
  # GET /
  def index
    render json: { message: "API is working!" }
  end
end
