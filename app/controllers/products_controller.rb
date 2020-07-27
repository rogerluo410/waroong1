class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.where('name like ?', "%#{params["product"]["name"]}%") if params["product"].present?
    @products = @products.includes(image_attachment: :blob)
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end
end
