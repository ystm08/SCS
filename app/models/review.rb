class Review < ApplicationRecord

  has_one_attached :review_image
  has_many :reviews_items
  has_many :items, through: :reviews_items
  has_many :favorites, dependent: :destroy
  belongs_to :user
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
