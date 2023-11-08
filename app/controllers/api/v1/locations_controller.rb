class Api::V1::LocationsController < ApplicationController

  def index
    cities = [
        'Berlin', 'Paris', 'Monaco', 'Singapore', 'Barcelona'
    ]

    render json: cities
  end

end