class AddSubtotalAndTaxAndShippingAndTotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :subtotal, :float
    add_column :orders, :tax, :float
    add_column :orders, :shipping, :float
    add_column :orders, :total, :float
  end
end
