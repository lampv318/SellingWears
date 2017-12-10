class AddTotalAndTaxAndSubtotalAndOrderStatusIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total, :float
    add_column :orders, :tax, :float
    add_column :orders, :subtotal, :float
    add_column :orders, :order_status_id, :integer
  end
  add_index :orders, :order_status_id
end
