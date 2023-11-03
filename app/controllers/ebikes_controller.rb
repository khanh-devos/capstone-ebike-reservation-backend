class EbikesController < ApplicationController
  def index
    render json: {
      success: true,
      data: Ebike.all.order(created_at: 'desc')
    }
  end
end
