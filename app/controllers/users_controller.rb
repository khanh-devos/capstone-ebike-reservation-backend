class UsersController < ApplicationController
  def index
    render json: {
      success: true,
      data: User.all
    }
  end
end
