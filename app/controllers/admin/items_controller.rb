class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update]
  before_action :all_load_categories, only: [:new, :edit, :update]

  def new
    @item = Item.new
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
    @items = Item.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @cart_item = CartItem.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :name, :introduction, :price, :item_image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def all_load_categories
    @categories = Category.all
  end

end