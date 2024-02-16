class User::ItemsController < ApplicationController
  before_action :authenticate_user!

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end