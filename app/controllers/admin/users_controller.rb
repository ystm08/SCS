class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :update]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
  end

  def update
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:is_active)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
