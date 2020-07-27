class OrdersController < ApplicationController
  add_breadcrumb '历史订单', :orders_path

  def index
    @orders = current_user.orders
  end

  def show
    add_breadcrumb '订单详情'
    @order = Order.find(params[:id])
  end
end
