class CreateQuotedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :quoted_products do |t|
      t.integer :product_id
      t.integer :quote_id
      t.integer :quantity

      t.timestamps
    end
  end
end
