class CreateCartedOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :carted_orders do |t|
      t.integer :user_id
      t.integer :quote_id
      t.integer :order_id
      t.string :status

      t.timestamps
    end
  end
end
