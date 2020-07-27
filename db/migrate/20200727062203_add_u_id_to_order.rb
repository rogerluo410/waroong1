class AddUIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :order_items, :active, :boolean, default: true
    rename_column :orders, :order_id, :uid
  end
end
