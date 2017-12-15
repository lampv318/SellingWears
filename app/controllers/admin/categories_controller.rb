class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :require_admin

  def index
    @categories = Category.select(:id, :parents_id,
      :name).order(:id).paginate page: params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Add Done"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.find_by id: params[:id]
    if @category
      @books = @category.products.select(:id, :category_id, :name, :price,
        :quantity, :picture).paginate page: params[:page]
    else
      flash[:danger] = "Not Found"
      redirect_to root_path
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :parents_id
  end
end
