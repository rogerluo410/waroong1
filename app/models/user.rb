class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  include Redis::Objects
  hash_key :cart

  def email_required? 
    false 
  end

  def add_item_to_cart(order_item_id, num = 1)
    order_item = OrderItem.find(order_item_id)
    self.cart[order_item_id.to_s] = { order_item: order_item, num: num }
  end

  def remove_item_to_cart order_item_id
    self.cart.delete(order_item_id.to_s)
  end

  def remove_all_items
    self.cart = {}
  end
end
