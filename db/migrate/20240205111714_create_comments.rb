class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id,     null: false
      t.integer :review_id,   null: false
      t.string :content,      null: false

      t.timestamps null: false
    end
  end
end
