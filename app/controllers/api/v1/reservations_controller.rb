class Api::V1::ReservationsController < ApplicationController
  def index
    # reservations = Reservation.all
    p('current_user:', current_user)
    reservations = Reservation.includes(:ebike).where(user_id: current_user.id)
    p('reservations', reservations, reservations[0].ebike)

    render json: reservations
  end

  def show
    reservation = Reservation.find_by(id: params[:id])
    render json: reservation
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.user_id = current_user.i
    if reservation.save
      render json: reservation, status: :ok
    else
      render json: { error: 'Reservation not created' }, status: 400
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id])
    reservation.destroy
    render json: reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date, :ebike_id)
  end
end
