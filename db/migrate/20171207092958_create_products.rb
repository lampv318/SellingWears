class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :rate
      t.float :price
      t.integer :quantity
      t.integer :size

      t.timestamps
    end
  end
end
