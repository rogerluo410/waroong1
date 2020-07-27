class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :set_categories

  add_breadcrumb proc { |c| c.root_crumb }, :root_path

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def current_order
    if session[:order_id].nil?
      Order.new
    else
      begin
        Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound => e
        Order.new
      end
    end
  end

  private

  def set_categories
    @categories = ProductCategory.all
  end

end