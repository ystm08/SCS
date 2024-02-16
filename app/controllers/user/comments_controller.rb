class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to review_path(review)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to review_path(params[:review_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
