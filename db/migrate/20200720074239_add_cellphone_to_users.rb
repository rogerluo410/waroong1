class AddCellphoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cellphone, :string
  end
end
