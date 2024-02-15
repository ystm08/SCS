class User::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review_item = @review.reviews_items.build
    @categories = Category.all
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
    @category = params[:category]
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
    else
      @category = "Look Book"
    end
  end

  def show
    @review = Review.find(params[:id])
    @cart_item = CartItem.new
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(review.id)
  end

  private

  def review_params
    params.require(:review).permit(:review_image, :content, :category, reviews_items_attributes: [:item_id, :_destroy])
  end

end