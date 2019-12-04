class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.admin?
      @users = User.all
      render json: { users: @users } and return
    end

    render json: { message: 'Users are not found' }
  end

  def show
    if current_user.admin?
      @user = User.find(params[:id])
      render json: { user: @user } and return
    end

    render json: { message: 'User is not found' }
  end
end
