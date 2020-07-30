class CartsController < ApplicationController
  def show
    add_breadcrumb '购物车'
    @addresses = current_user.addresses.where("is_delete is false") if current_user.present?
    @order_items = current_order.order_items.includes(product: [image_attachment: :blob])
  end
end