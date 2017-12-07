class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :total_amount_consum, default: 0
      t.boolean :is_admin, default: false
      t.integer :member_type, default: 0

      t.timestamps
    end
  end
end
