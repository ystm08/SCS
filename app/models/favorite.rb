class Favorite < ApplicationRecord
  include Notifiable

  has_one :notification, as: :notifiable, dependent: :destroy
  belongs_to :user
  belongs_to :review

  validates :user_id, uniqueness: {scope: :review_id}

  after_create do
    create_notification(user_id: review.user_id)
  end

  def notification_message
    "#{user.user_name}さんがあなたのレビューにいいねしました"
  end

  def notification_path
    user_path(user)
  end

end