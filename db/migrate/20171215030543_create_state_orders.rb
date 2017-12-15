class CreateStateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :state_orders do |t|
      t.string :name

      t.timestamps
    end
  end
end
