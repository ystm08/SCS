class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id,    null: false
      t.integer :review_id,  null: false

      t.timestamps null: false
    end
  end
end
