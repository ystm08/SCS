class User::OrdersController < ApplicationController

  def confirm
    @cart_items = CartItem.where(user_id: current_user.id)
    ary = []
      @cart_items.each do |cart_item|
        ary << cart_item.item.add_tax_price*cart_item.amount
      end
      @cart_items_price = ary.sum
      @selected_address = "#{current_user.post_code} #{current_user.address} #{current_user.name}"
  end

  def create
    @order = Order.new
    @order.user_id = current_user.id
    @cart_items = CartItem.where(user_id: current_user.id)
    any = []
    @cart_items.each do |cart_item|
      any << cart_item.item.add_tax_price*cart_item.amount
    end
    @order.total_payment = any.sum
    @selected_address = "#{current_user.post_code} #{current_user.address} #{current_user.name}"
    @order.status = 1

    if @order.save
      @cart_items.each do |cart_item|
        OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.add_tax_price, amount: cart_item.amount)
      end
      @cart_items.destroy_all
      redirect_to complete_path
    else
      render :confirm
    end
  end

  def complete
  end

  def index
    @orders = current_user.orders.all
  end

end
