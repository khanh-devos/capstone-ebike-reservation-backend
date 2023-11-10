class Api::V1::ReservationsController < ApplicationController
  def index
    # reservations = Reservation.all
    p('current_user:', current_user)
    reservations = Reservation.includes(:ebike).where(user_id: current_user.id).order(created_at: 'desc')
    p('reservations', reservations, reservations[0].ebike)

    render json: reservations
  end

  def show
    reservation = Reservation.find_by(id: params[:id])
    render json: reservation
  end

  def create
    unless validate_reservation
      render json: { error: 'failed' }, status: 400
      return
    end

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

  def validate_reservation
    return false if reservation_params[:ending_date] < params[:starting_date]

    true
  end
end
