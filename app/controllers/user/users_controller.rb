class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user,only: [:edit]

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page]).per(8)
    @favorite_all = @user.reviews.inject(0) { |sum, review| sum + review.favorites.count }
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:review_id)
    @favorite_review = Review.where(id: favorites).page(params[:page]).per(8)
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(current_user.id)
    if @user.guest_user?
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィールを編集できません。"
    end
  end
end
