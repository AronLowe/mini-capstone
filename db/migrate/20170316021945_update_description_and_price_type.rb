class UpdateDescriptionAndPriceType < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 9, scale: 2
    change_column :products, :description, :text 
  end
end
