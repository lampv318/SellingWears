class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
    unless @product
      flash[:danger] = "not_found"
      redirect_to root_path
    end
  end

  def index
    @products = Product.all
  end
end
