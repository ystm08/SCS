class User::ItemsController < ApplicationController

  def show
    # render layout: false
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
