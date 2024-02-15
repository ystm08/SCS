class Order < ApplicationRecord

  has_many :order_details
  has_many :items, through: :order_details
  belongs_to :user

  def subtotal_without_tax
    order_details.sum { |detail| detail.item.price * detail.amount }
  end

end
