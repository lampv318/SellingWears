class AddDescriptionAndCodeAndImgToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description, :string
    add_column :products, :code, :string
    add_column :products, :img_url, :string
  end
end
