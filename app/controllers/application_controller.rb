class ApplicationController < ActionController::API
  include JwtApi
  before_action :authenticate_request, except: %i[login register]

  attr_reader :current_user

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header

    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
