class Comment < ApplicationRecord
  include Notifiable

  has_many :notifications, as: :notifiable, dependent: :destroy
  belongs_to :user
  belongs_to :review

  validates :content, presence: true

  after_create do
    notifications.create(user_id: review.user.id)
  end

  def notification_message
    "#{user.user_name}さんがあなたのレビューにコメントしました"
  end

  def notification_path
    review_path(review)
  end

end
