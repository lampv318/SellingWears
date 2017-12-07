class CreateOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :price
      t.integer :number

      t.timestamps
    end
    add_index :order_lines, :order_id
    add_index :order_lines, :product_id
  end
end
