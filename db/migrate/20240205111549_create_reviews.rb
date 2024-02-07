class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id,  null: false
      t.string :content,   null: false

      t.timestamps null: false
    end
  end
end
