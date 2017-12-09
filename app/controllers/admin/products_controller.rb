class Admin::ProductsController < ApplicationController
  before_action :logged_in_user
  before_action :require_admin

  def index
    @products = Product.select(:id, :name, :quantity).order(:name).paginate page: params[:page]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "Add Done!"
      redirect_to @product
    else
      flash[:alert] = "Wrong"
      render :new
    end
  end

  def show
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = "not_found to show"
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :category, 
      :price, :description, :quantity , :picture
  end

end
