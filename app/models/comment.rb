class Comment < ApplicationRecord

  has_many :notifications, as: :notifiable, dependent: :destroy
  belongs_to :user
  belongs_to :review

  validates :content, presence: true

  after_create do
    notifications.create(user_id: review.user.id)
  end

end
