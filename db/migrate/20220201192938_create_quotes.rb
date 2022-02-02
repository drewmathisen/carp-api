class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.integer :user_id
      t.decimal :total, precision: 8, scale: 2
      t.integer :order_id

      t.timestamps
    end
  end
end
