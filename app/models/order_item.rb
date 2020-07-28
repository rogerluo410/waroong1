class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  default_scope { order(:created_at) }

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product&.sell_price_fen
    end
  end

  def total_price
    if unit_price
      unit_price * quantity
    else
      0
    end
  end

  def unit_price_yuan
    (unit_price.to_f / 100.00).truncate(2)
  end
    
  def unit_price_yuan= (yuan)
    self.unit_price = yuan.to_f * 100
  end

  def total_price_yuan
    (total_price.to_f / 100.00).truncate(2)
  end
    
  def total_price_yuan= (yuan)
    self.total_price = yuan.to_f * 100
  end

private
  def product_present
    if product.nil?
      errors.add(:product, "药品不存在.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "订单不存在.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
