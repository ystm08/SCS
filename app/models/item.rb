class Item < ApplicationRecord

  has_one_attached :item_image
  has_many :reviews_items
  has_many :reviews, through: :reviews_items
  belongs_to :category

  def add_tax_price
    (self.price * 1.10).round
  end
end
