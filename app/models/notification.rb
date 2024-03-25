class Notification < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  def message
    if notifiable_type == "Review"
      "#{notifiable.user.user_name}さんが新しいレビューを投稿しました"
    elsif notifiable_type == "Favorite"
      "#{notifiable.user.user_name}さんがあなたのレビューにいいねしました"
    else notifiable_type == "Comment"
      "#{notifiable.user.user_name}さんがあなたのレビューにコメントしました"
    end
  end

  def notifiable_path
    if notifiable_type == "Review"
      review_path(notifiable.id)
    elsif notifiable_type == "Favorite"
      user_path(notifiable.user.id)
    else notifiable_type == "Comment"
      review_path(notifiable.review.id)
    end
  end
end
