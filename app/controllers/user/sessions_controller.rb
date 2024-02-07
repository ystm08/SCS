# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]


  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "ゲストユーザーでログインしました。"
  end

  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end

  private

  def user_state
    user = User.find_by(email: params[:user][:email])
    return if user.nil?
    return unless user.valid_password?(params[:user][:password])
    redirect_to new_user_registration_path unless user.is_active
  end

end
