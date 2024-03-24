class Review < ApplicationRecord

  has_one_attached :review_image

  has_many :reviews_items
  has_many :items, through: :reviews_items
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  belongs_to :user
  belongs_to :category

  validates :review_image, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :reviews_items, allow_destroy: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_review_image(width, height)
    review_image.variant(resize_to_limit: [width, height]).processed
  end

  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id)
    end
  end

end