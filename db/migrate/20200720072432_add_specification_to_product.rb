class AddSpecificationToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :specification, :string
    add_column :products, :price_fen, :string
    add_column :products, :sell_price_fen, :string
    add_column :products, :inventory, :integer
    add_column :products, :vendor_cn, :string
  end
end
