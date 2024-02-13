class Order < ApplicationRecord

  has_many :order_details
  has_many :items, through: :order_details
  belongs_to :user

end
