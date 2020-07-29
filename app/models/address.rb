class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :cellphone
  validates_presence_of :address
  validates_presence_of :post
  validates :cellphone, format: { with: /1\d{10}/, message: "格式错误" }
end
