class AuthenticationController < ApplicationController
    
    # POST /login
    def login
      @user = User.find_by_name(params[:name])
      
      if @user&.valid_password?(params[:password])
        token = jwt_encode(user_id: @user.id)

        render json: { 
          token: token,
          user: {
            id: @user.id,
            name: @user.name
          }
        }, status: :ok

      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    def register
      p user_params

      render json: { error: 'email failed' }, status: 400 if !valid_email(user_params)

      render json: { error: 'password failed' }, status: 400 if !valid_pass(user_params)

      user = User.create(user_params)
      
      if user.save
        render json: {
          success: true,
          message: "Successfully created" 
        }, status: :ok

      else
        render json: { error: "Failed"}, status: 400

      end
    end
  

    private

    def token_analyze(token)
      puts jwt_decode(token)
    end
    

    def user_params
      params.require(:user)
        .permit(:role, :name, :email, :password, :password_confirmation)
    end

    def valid_email(user_params)
      user_params[:email].match(/\A[^@\s]+@[^@\s]+\z/)
    end

    def valid_pass(user_params)
      return false if !user_params[:password].eql? user_params[:password_confirmation] 
      
      return false if !user_params[:password].match(/^(?=.*[\d])+(?=.*[a-zA-Z])+^.{5,}$/)

      true
    end

  end
  