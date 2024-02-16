class Item < ApplicationRecord

  has_one_attached :item_image

  has_many :reviews_items
  has_many :reviews, through: :reviews_items
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_many :orders, through: :order_details
  belongs_to :category

  def add_tax_price
    (self.price * 1.10).round
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "introduction", "name", "price"]
  end

end