class User::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

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
    @reviews = Review.order(created_at: :desc).page(params[:page]).per(12)
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
    @cart_item = CartItem.new
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(current_user)
  end

  private

  def review_params
    params.require(:review).permit(:review_image, :content, :category_id, reviews_items_attributes: [:id, :item_id, :_destroy])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def is_matching_login_user
    unless @review.user_id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end