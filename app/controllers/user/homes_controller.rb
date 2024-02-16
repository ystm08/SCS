class User::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

  def top
  end

  def about
  end

  def latest
    @latest_reviews = Review.order(created_at: :desc).limit(7)
    render :layout => 'latest'
  end

end