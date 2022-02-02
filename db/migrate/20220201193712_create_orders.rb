class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
