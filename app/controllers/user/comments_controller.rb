class User::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.review_id = @review.id
    unless @comment.save
      render 'error'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_review
    @review = Review.find(params[:review_id])
  end
end
