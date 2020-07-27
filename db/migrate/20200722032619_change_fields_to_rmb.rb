class ChangeFieldsToRmb < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :subtotal, :integer, default: 0
    change_column :orders, :tax, :integer, default: 0
    change_column :orders, :shipping, :integer, default: 0
    change_column :orders, :total, :integer, default: 0
    change_column :order_items, :unit_price, :integer, default: 0
    change_column :order_items, :total_price, :integer, default: 0
    change_column :products, :price_fen, :integer, using: 'price_fen::integer', default: 0
    change_column :products, :sell_price_fen, :integer, using: 'sell_price_fen::integer', default: 0
    add_column :orders, :address, :string
  end
end
