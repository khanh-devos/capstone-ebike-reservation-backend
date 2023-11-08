class Api::V1::ReservationsController < ApplicationController
  def index
    #reservations = Reservation.all
    p('current_user:',current_user)
    reservations = Reservation.includes(:ebike).where(user_id: current_user.id)
    p('reservations',reservations, reservations[0].ebike) 
    
    render json: reservations
  end

  def show
    reservation = Reservation.find_by(id: params[:id])
    render json: reservation
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.user_id = current_user.id
    if reservation.save
      render json: reservation
    else
      render json: { error: 'Reservation not created' }
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id])
    reservation.destroy
    render json: reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :ebike_id)
  end
end
