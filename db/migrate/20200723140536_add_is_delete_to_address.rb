class AddIsDeleteToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :is_delete, :boolean, default: false
  end
end
