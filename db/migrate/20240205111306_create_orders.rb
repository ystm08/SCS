class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id,        null: false
      t.integer :total_payment,  null: false
      t.integer :status,         null: false

      t.timestamps null: false
    end
  end
end
