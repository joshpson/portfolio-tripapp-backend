class Api::V1::UsersController < ApplicationController


  def index
    render json: User.all.limit(10)
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 200, msg: 'User was created.'}
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
 end

end
