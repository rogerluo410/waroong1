class AddFkCascade < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :order_items, column: :order_id
    remove_foreign_key :order_items, column: :product_id
    remove_foreign_key :orders, column: :order_status_id
    add_foreign_key "order_items", "orders", on_delete: :cascade
    add_foreign_key "orders", "order_statuses", on_delete: :cascade
    add_foreign_key "order_items", "products", on_delete: :cascade
  end
end
