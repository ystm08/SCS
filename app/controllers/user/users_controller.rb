class User::UsersController < ApplicationController
  before_action :ensure_guest_user,only: [:edit]

  def show
    @user = User.find(params[:id])
    @reviews = current_user.reviews
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
