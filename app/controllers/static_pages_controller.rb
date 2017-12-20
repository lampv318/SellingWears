class StaticPagesController < ApplicationController 
  def home
    @product_1 = Product.where category_id: '1'
    @product_2 = Product.where category_id: '2'
    @product_3 = Product.where category_id: '3'
    if logged_in?
      @order_line = current_order.order_lines.new
    end
  end

  def show
    if valid_page?
      render template: "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def about
  end

  def help
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/static_pages/#{params[:page]}.html.erb"))
  end
end
