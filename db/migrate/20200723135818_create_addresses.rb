class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.string :name, null: false
      t.string :cellphone, null: false
      t.string :address, null: false
      t.string :post, null: false
      t.timestamps
    end
  end
end
