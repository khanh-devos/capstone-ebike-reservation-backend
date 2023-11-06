class ApplicationController < ActionController::API
  include JwtApi
  before_action :authenticate_request, except: %i[login register]

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header

    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name email role])
  end
end
