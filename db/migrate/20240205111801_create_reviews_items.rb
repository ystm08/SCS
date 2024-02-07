class CreateReviewsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews_items do |t|
      t.integer :review_id,   null: false
      t.integer :item_id,     null: false

      t.timestamps null: false
    end
  end
end
