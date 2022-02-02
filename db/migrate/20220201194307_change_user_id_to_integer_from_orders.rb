class ChangeUserIdToIntegerFromOrders < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |table|
      table.change :user_id, :integer
    end
  end
end
