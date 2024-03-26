class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:followings, :followers]

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def followings
    @users = @user.followings
    @followings = @users
    @followers = @user.followers
  end

  def followers
    @users = @user.followers
    @followings = @user.followings
    @followers = @users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end