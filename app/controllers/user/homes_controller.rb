class User::HomesController < ApplicationController

  def top
  end

  def about
  end

  def latest
    @latest_reviews = Review.order(created_at: :desc).limit(8)
  end

end
