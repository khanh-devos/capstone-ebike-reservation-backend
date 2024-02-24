class AuthenticationController < ApplicationController
  # POST /login
  def login
    @user = User.find_by_name(params[:name])

    if @user&.valid_password?(params[:password])

      render json: {
        token: jwt_encode(user_id: @user.id),
        user: {
          id: @user.id,
          name: @user.name,
          role: @user.role
        }
      }, status: :ok

    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def register
    return unless valid_email
    return unless valid_pass
    return unless valid_role

    user = User.new(user_params)
    if user.save

      render json: {
        token: jwt_encode(user_id: user.id),
        user: {
          id: user.id,
          name: user.name,
          role: user.role
        }
      }, status: :ok

    else
      render json: { error: 'Sign up Failed!!' }, status: 400

    end
  end

  def logout
    @current_user = nil
  end

  private

  def token_analyze(token)
    puts jwt_decode(token)
  end

  def user_params
    params.require(:user)
      .permit(:role, :name, :email, :password, :password_confirmation)
  end

  def valid_role
    roles = %W[admin client]
    unless roles.include?(user_params[:role])
      render json: { error: 'role is "client" or "admin" only' }, status: 400
      return false
    end

    true
  end

  def valid_email
    unless user_params[:email].match(/\A[^@\s]+@[^@\s]+\z/)
      render json: { error: 'email failed' }, status: 400
      return false
    end

    true
  end

  def valid_pass
    unless user_params[:password].eql? user_params[:password_confirmation]
      render json: { error: 'Password & password confirmation should be the same' }, status: 400
      return false
    end

    unless user_params[:password].match(/^(?=.*[\d])+(?=.*[a-zA-Z])+^.{5,}$/)
      render json: { error: 'Password should have at least 1 number & 5-character length.' }, status: 400
      return false
    end

    true
  end
end
