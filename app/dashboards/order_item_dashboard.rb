require "administrate/base_dashboard"

class OrderItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    product: Field::BelongsTo,
    order: Field::BelongsTo,
    id: Field::Number,
    unit_price_yuan: Field::Number.with_options(searchable: false, prefix: "¥"),
    quantity: Field::Number,
    total_price_yuan: Field::Number.with_options(searchable: false, prefix: "¥"),
    created_at: Field::DateTime.with_options(format: "%Y-%m-%d %A %H:%M:%S"),
    updated_at: Field::DateTime.with_options(format: "%Y-%m-%d %A %H:%M:%S"),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :product,
    :order,
    :unit_price_yuan,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :product,
    :order,
    :id,
    :unit_price_yuan,
    :quantity,
    :total_price_yuan,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :product,
    :order,
    :unit_price_yuan,
    :quantity,
    :total_price_yuan,
  ].freeze

  # Overwrite this method to customize how order items are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(order_item)
    "订单项 ##{order_item.id}"
  end
end
