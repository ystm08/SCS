class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update]

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page]).per(2)
  end

  def show
    @cart_item = CartItem.new
  end

  def edit
    @categories = Category.all
  end

  def update
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      @categories = Category.all
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:category_id, :name, :introduction, :price, :item_image)
  end

end