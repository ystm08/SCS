class RemoveCategoryFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :category, :string
  end
end
