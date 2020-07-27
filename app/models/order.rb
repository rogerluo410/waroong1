class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  has_many :order_items, dependent: :destroy
  before_save :update_subtotal

  def to_wait_pay
    order_status_id = 2 # 待支付
  end

  def subtotal
    order_items.includes(:product).collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    (subtotal || 0) + (tax || 0) + (shipping || 0)
  end

  def subtotal_yuan
    (subtotal.to_f / 100.00).truncate(2)
  end
    
  def subtotal_yuan= (yuan)
    self.subtotal = yuan.to_f * 100
  end

  def total_yuan
    (total / 100.00).round(1)
  end
    
  def total_yuan= (yuan)
    self.total = yuan.to_f * 100
  end

  def tax_yuan
    (tax.to_f / 100.00).truncate(2)
  end
    
  def tax_yuan= (yuan)
    self.tax = yuan.to_f * 100
  end

  def shipping_yuan
    (shipping.to_f / 100.00).truncate(2)
  end
    
  def shipping_yuan= (yuan)
    self.shipping = yuan.to_f * 100
  end
  
private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
