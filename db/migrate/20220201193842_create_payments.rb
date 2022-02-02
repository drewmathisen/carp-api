class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :order_id
      t.decimal :amount, precision: 8, scale: 2
      t.string :method
      t.timestamps
    end
  end
end
