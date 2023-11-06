class EbikesController < ApplicationController
  def index
    render json: {
      data: Ebike.all.order(created_at: 'desc')
    }, status: :ok
  end
end
