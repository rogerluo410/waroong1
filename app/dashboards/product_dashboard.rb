require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    # order_items: Field::HasMany,
    product_category: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    price_fen_yuan: Field::Number.with_options(searchable: false, prefix: "¥"),
    sell_price_fen_yuan: Field::Number.with_options(searchable: false,  prefix: "¥"),
    inventory: Field::Number,
    specification: Field::String,
    vendor_cn: Field::String,
    active: Field::Boolean,
    created_at: Field::DateTime.with_options(format: "%Y-%m-%d %A %H:%M:%S"),
    updated_at: Field::DateTime.with_options(format: "%Y-%m-%d %A %H:%M:%S"),
    image: Field::ActiveStorage,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :specification,
    :price_fen_yuan,
    :sell_price_fen_yuan,
    :inventory,
    :vendor_cn,
    :active,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :product_category,
    :id,
    :name,
    :specification,
    :price_fen_yuan,
    :sell_price_fen_yuan,
    :image,
    :inventory,
    :vendor_cn,
    :active,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :product_category,
    :name,
    :specification,
    :price_fen_yuan,
    :sell_price_fen_yuan,
    :inventory,
    :vendor_cn,
    :active,
    :image,
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(product)
    "药品 ##{product.name}"
  end
end
