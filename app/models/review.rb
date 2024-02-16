class Review < ApplicationRecord

  has_one_attached :review_image

  has_many :reviews_items
  has_many :items, through: :reviews_items
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :category

  accepts_nested_attributes_for :reviews_items, allow_destroy: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_review_image(width, height)
    review_image.variant(resize_to_limit: [width, height]).processed
  end

end