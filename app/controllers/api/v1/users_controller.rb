class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, only: [:show_user]

  def index
    @users = User.all
    render json: @users
  end

  def show_user
    render json: current_user
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      render json: @user, status: :accepted
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
 end

end
