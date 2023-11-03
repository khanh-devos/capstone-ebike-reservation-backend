class ReservationsController < ApplicationController
  def index
    render json: {
      success: true,
      data: Reservation.all.order(created_at: 'desc')
    }
  end
end
