class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
    @comments = @product.comments.paginate(page: params[:page])
    if @product
      @comment = @product.comments.newest.paginate page: params[:page]
    else
      flash[:danger] = "Not found"
      redirect_to root_path
    end
  end

  def index
    @products = Product.all
  end
end
