class User::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @review_item = @review.reviews_items.build
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
    @reviews = Review.page(params[:page]).per(12).order(created_at: :desc)
    if params[:category].present?
      case params[:category]
      when 'fashion'
        @reviews = @reviews.where(category: "1")
        @category = "Fashion"
      when 'nail'
        @reviews = @reviews.where(category: "2")
        @category = "Nail"
      when 'cosmetics'
        @reviews = @reviews.where(category: "3")
        @category = "Cosmetics"
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
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(current_user)
  end

  private

  def review_params
    params.require(:review).permit(:review_image, :content, :category_id, reviews_items_attributes: [:id, :item_id, :_destroy])
  end

end