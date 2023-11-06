class UsersController < ApplicationController
  def index
    render json: {
      success: true,
      data: User.all
    }
  end

  


  def user_sign_out
    puts current_user
    sign_out current_user
  end
end
