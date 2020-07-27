require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    order_items: Field::HasMany,
    id: Field::Number,
    subtotal_yuan: Field::Number.with_options(searchable: false, prefix: "¥"),
    tax_yuan: Field::Number.with_options(searchable: false, prefix: "¥"),
    shipping_yuan: Field::Number.with_options(searchable: false, prefix: "¥"),
    total_yuan: Field::Number.with_options(searchable: false, prefix: "¥"),
    address: Field::String,
    order_status: Field::BelongsTo,
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
    :order_items,
    :subtotal_yuan,
    :total_yuan,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :order_items,
    :id,
    :address,
    :subtotal_yuan,
    :tax_yuan,
    :shipping_yuan,
    :total_yuan,
    :order_status,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :order_items,
    :address,
    :subtotal_yuan,
    :tax_yuan,
    :shipping_yuan,
    :total_yuan,
    :order_status,
  ].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(order)
    "订单 ##{order.id}"
  end
end
