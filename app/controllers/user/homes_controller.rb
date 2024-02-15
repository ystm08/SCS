class User::HomesController < ApplicationController

  def top
  end

  def about
  end

  def latest
    if params[:category].present?
      @reviews = Review.where(category: params[:category])
    else
      @reviews = Review.all
    end
    @latest_reviews = Review.order(created_at: :desc).limit(7)
    render :layout => 'latest'
  end

end