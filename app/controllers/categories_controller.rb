class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    if logged_in?
      @order_line = current_order.order_lines.new
    end
  end

  def show
    if logged_in?
      @order_line = current_order.order_lines.new
    end
    @category = Category.find_by id: params[:id]
    if @category
      @products = @category.products.select(:id, :category_id, :name, :price,
        :quantity, :picture).paginate page: params[:page]
    else
      flash[:danger] = "not found"
      redirect_to root_path
    end
  end
end
