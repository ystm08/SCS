class CartItem < ApplicationRecord

  belongs_to :user
  belongs_to :item

  def subtotal
    item.add_tax_price * amount
  end

end