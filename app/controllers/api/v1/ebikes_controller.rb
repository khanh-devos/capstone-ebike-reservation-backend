class Api::V1::EbikesController < ApplicationController
  skip_before_action :authenticate_request, only: %i[index]

  def index
    ebikes = Ebike.where(removed: false).order(created_at: 'desc')
    render json: ebikes, status: :ok
  end

  def show
    ebike = Ebike.find_by(id: params[:id])
    render json: ebike
  end

  def create
    return unless current_user.role.eql?('admin')

    ebike = Ebike.new(ebike_params)
    ebike.seller_id = current_user.id
    if ebike.save
      render json: ebike, status: :ok
    else
      render json: { error: 'Ebike not created' }, status: 400
    end
  end

  def destroy
    ebike = Ebike.find_by(id: params[:id])
    return unless current_user.id.eql?(ebike.seller_id)

    # p('delete params', params)
    ebike.removed = true
    ebike.save
    render json: ebike
  end

  private

  def ebike_params
    params.require(:ebike)
      .permit(:name, :image, :price, :description, :city, :weight, :model)
  end
end
