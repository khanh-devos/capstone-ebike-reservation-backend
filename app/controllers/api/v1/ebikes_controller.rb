class Api::V1::EbikesController < ApplicationController
  def index
    ebikes = Ebike.all
    render json: ebikes, status: :ok
  end

  def show
    ebike = Ebike.find_by(id: params[:id])
    render json: ebike
  end

  def create
    ebike = Ebike.new(ebike_params)
    ebike.seller_id = current_user.id
    if ebike.save
      render json: ebike
    else
      render json: { error: 'Ebike not created' }
    end
  end

  def destroy
    ebike = Ebike.find_by(id: params[:id])
    ebike.destroy
    render json: ebike
  end

  private

  def ebike_params
    params.require(:ebike).permit(:name, :image, :price, :description, :brand_id)
  end
end
