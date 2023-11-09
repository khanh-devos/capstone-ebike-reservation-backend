class Api::V1::LocationsController < ApplicationController
  def index
    cities = %w[
      Berlin Stuttgart Munich Cologne Frankfurt Dortmund
    ]

    render json: cities
  end
end
