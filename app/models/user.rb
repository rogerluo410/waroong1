class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :cellphone, format: { with: /1\d{10}/, message: "格式错误" }

  include Redis::Objects
  hash_key :cart, :expiration => 15.minutes

  def email_required? 
    false 
  end

  def loop_to_cart current_order
    self.cart[current_order.uid] = current_order
  end

  def remove_item_to_cart order_item_id
    self.cart.delete(order_item_id.to_s)
  end

  def remove_all_items
    self.cart = {}
  end
end
