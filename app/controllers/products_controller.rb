class ProductsController < ApplicationController
  def index
    @products = Product.all
    if logged_in?
      @order_line = current_order.order_lines.new
    end
  end


  def show
    @product = Product.find_by id: params[:id]
    @comments = @product.comments.paginate page: params[:page]
    if logged_in?
      @order_line = current_order.order_lines.new
    end
    if @product
      @comment = @product.comments.newest.paginate page: params[:page]
    else
      flash[:danger] = "Not found"
      redirect_to root_path
    end
  end

end
