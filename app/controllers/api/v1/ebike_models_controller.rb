class Api::V1::EbikeModelsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[index]

  def index
    ebike_models = [
      'Haibike',
      'Juiced Bikes',
      'Ariel Rider',
      'Riese & Mülle'
    ]

    render json: ebike_models
  end
end
