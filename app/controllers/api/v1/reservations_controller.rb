class Api::V1::ReservationsController < ApplicationController
  def index
    reservations = Reservation.includes(:ebike).order(created_at: 'desc')
    render json: reservations
  end

  def show
    reservation = Reservation.find_by(id: params[:id])
    render json: reservation
  end

  def create
    unless validate_time
      render json: { error: 'failed' }, status: 400
      return
    end

    # unless validate_ebike_availability
    #   render json: { error: 'failed' }, status: 400
    #   return
    # end

    reservation = Reservation.new(reservation_params)
    reservation.user_id = current_user.id

    if reservation.save
      render json: reservation, status: :ok
    else
      render json: { error: 'Reservation not created' }, status: 400
    end
  end

  def delete
    reservation = Reservation.find_by(id: params[:id])
    reservation.destroy
    render json: reservation
  end

  private

  def reservation_params
    params.require(:reservation)
      .permit(:starting_date, :ending_date, :ebike_id, :location)
  end

  def validate_time
    return false if reservation_params[:starting_date] < Time.now
    return false if reservation_params[:starting_date] > reservation_params[:ending_date]

    true
  end

  def validate_ebike_availability
    return true if Reservation.where(
      ebike_id: reservation_params[:ebike_id],
      book_date: reservation_params[:book_date]
    ).empty?

    false
  end
end
