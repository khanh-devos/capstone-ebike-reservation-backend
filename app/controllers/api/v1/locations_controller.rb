class Api::V1::LocationsController < ApplicationController
  def index
    cities = %w[
      Berlin Paris Monaco Singapore Barcelona
    ]

    render json: cities
  end
end
