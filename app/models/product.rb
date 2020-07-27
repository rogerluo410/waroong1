require 'uploads'

class Product < ApplicationRecord
  belongs_to :product_category
  has_many :order_items, dependent: :destroy
  has_one_attached :image
  default_scope { where(active: true) }
  after_create :set_hits

  include Redis::Objects
  counter :hits

  def price_fen_yuan
    (price_fen.to_f / 100).truncate(2)
  end
    
  def price_fen_yuan= (yuan)
    self.price_fen = yuan.to_f * 100
  end

  def sell_price_fen_yuan
    (sell_price_fen.to_f / 100).truncate(2)
  end
    
  def sell_price_fen_yuan= (yuan)
    self.sell_price_fen = yuan.to_f * 100
  end

  def image_header_variant
    variation =
      ActiveStorage::Variation.new(Uploads.resize_to_limit(width: 500, height: -1, blob: image.blob))
    ActiveStorage::Variant.new(image.blob, variation)
  end

  protected
  def set_hits
    self.hits.incr(self.inventory)
  end

end
