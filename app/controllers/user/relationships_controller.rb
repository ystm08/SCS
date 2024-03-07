class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

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
    @user = User.find(params[:id])
    @users = @user.followings
    @followings = @users
    @followers = @user.followers
    @favorite_all = @user.reviews.inject(0) { |sum, review| sum + review.favorites.count }
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @followings = @user.followings
    @followers = @users
    @favorite_all = @user.reviews.inject(0) { |sum, review| sum + review.favorites.count }
  end

end