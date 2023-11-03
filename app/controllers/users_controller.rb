class UsersController < ApplicationController
  def user_sign_out
    puts current_user
    sign_out current_user
  end
end
