class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :product_id
    add_index :relationships, [:user_id, :product_id], unique: true
  end
end
