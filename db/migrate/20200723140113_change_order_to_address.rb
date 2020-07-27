class Change < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :address
    add_reference :orders, :address
  end
end
