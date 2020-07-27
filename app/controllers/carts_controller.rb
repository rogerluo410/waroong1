class CartsController < ApplicationController
  def show
    add_breadcrumb '购物车'
    @order_items = current_order.order_items.includes(product: [image_attachment: :blob])
  end
end