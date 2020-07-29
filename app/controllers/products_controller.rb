class ProductsController < ApplicationController
  add_breadcrumb '商品列表', :products_path

  def index
    @products = Product.all
    @products = Product.where('name like ?', "%#{params["product"]["name"]}%") if params["product"].present?
    @products = @products.includes(image_attachment: :blob)
    @order_item = current_order.order_items.new
  end

  def show
    add_breadcrumb '商品详情'
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end
end
