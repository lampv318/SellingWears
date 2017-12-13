class AddTotalPriceToOrderLines < ActiveRecord::Migration[5.1]
  def change
    add_column :order_lines, :total_price, :float
  end
end
