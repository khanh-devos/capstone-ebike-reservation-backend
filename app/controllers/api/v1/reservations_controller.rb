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
    return unless validate_time
    return unless validate_ebike_availability

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
    s = reservation_params[:starting_date]
    e = reservation_params[:ending_date]

    if s > e || s < Time.now
      render json: { error: 'Failed to create a reservaition' }, status: 400
      return false
    end

    true
  end

  def validate_ebike_availability
    s = reservation_params[:starting_date]
    e = reservation_params[:ending_date]

    ebike_booked_dates = Reservation.where(ebike_id: reservation_params[:ebike_id])

    unless ebike_booked_dates.all? { |item| s > item.ending_date || e < item.starting_date }
      render json: { error: 'Failed to create a reservaition' }, status: 400
      return false
    end

    true
  end
end
