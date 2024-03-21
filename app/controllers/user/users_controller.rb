class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :favorites]
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @reviews = @user.reviews.page(params[:page]).per(8)
    @favorite_all = @user.reviews.inject(0) { |sum, review| sum + review.favorites.count }
    @followers = @user.followers
    @followings = @user.followings
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィール情報が更新されました。"
    else
      render "edit"
    end
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:review_id)
    @favorite_review = Review.where(id: favorites).page(params[:page]).per(12)
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

# ゲストユーザーのプロフィール編集防止
  def ensure_guest_user
    @user = User.find(current_user.id)
    if @user.guest_user?
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィールを編集できません。"
    end
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end
