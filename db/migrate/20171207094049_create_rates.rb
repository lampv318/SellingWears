class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :rate

      t.timestamps
    end
    add_index :rates, :user_id
    add_index :rates, :product_id
  end
end
