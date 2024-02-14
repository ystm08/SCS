class User::CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:increase, :decrease, :destroy]

  def index
    @cart_items = current_user.cart_items
  end

  def create
    increase_or_create(cart_item_params)
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:user_id, :item_id, :amount)
  end

  def set_cart_item
    @cart_item = current_user.cart_items.find(params[:id])
  end

  def increase_or_create(cart_item_params)
    cart_item = current_user.cart_items.find_by(item_id: cart_item_params[:item_id])
    if cart_item
      cart_item.increment!(:amount, cart_item_params[:amount].to_i)
    else
      current_user.cart_items.create(item_id: cart_item_params[:item_id], amount: cart_item_params[:amount])
    end
  end

end