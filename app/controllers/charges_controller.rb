class ChargesController < ApplicationController
  def new
    add_breadcrumb '支付订单'
    unless params["address_id"].present?
      flash[:error] = '提交订单失败, 请先添加收货地址'
      redirect_to cart_path and return
    end

    current_order.update(order_status_id: 2, user_id: current_user.id)
    current_user.loop_to_cart current_order
    @address = current_user.addresses.find(params["address_id"])
  end

  def create
    # Amount in cents
    @amount = current_order.subtotal

    session[:order_id] = nil
  end

end
