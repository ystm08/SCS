class User::CategoriesController < ApplicationController
  
  def index
    @category = Category.find(params[:category_id])
    @reviews = Review.joins(:item).where(items: { category_id: @category.id })
  end
  
end
