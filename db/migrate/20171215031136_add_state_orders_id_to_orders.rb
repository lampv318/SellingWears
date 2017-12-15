class AddStateOrdersIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :state_order_id, :integer
  end
end
