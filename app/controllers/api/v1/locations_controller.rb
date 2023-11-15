class Api::V1::LocationsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[index]

  def index
    cities = %w[
      Berlin Stuttgart Munich Cologne Frankfurt Dortmund
    ]

    render json: cities
  end
end
