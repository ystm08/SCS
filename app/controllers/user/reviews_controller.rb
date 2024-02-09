class User::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def index
    @category = params(:category)
    @reviews = Review.all
    if params[:category].present?
      case params[:category]
      when 'fashion'
        @reviews = @reviews.where(category: 'fashion')
      when 'nail'
        @reviews = @reviews.where(category: 'nail')
      when 'cosmetics'
        @reviews = @reviews.where(category: 'cosmetics')
      end
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:review_image, :content)
  end
end
