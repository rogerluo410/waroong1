class AddOrderIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_id, :string
  end
end
