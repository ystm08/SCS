class Order < ApplicationRecord

  has_many :order_details
  has_many :items, through: :order_details
  belongs_to :user

  enum status: {shipping_in_process: 0, shipping_completed: 1}

  def self.order_statuses_i18n
    statuses.keys.map do |status|
      [I18n.t("enums.order.status.#{status}"), status]
    end.to_h
  end

  def subtotal_without_tax
    order_details.sum { |detail| detail.item.price * detail.amount }
  end

end
