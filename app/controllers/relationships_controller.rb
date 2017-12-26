class RelationshipsController < ApplicationController

  def create
    product = Product.find params[:relationship][:product_id]
    if current_user.products.find_by id: params[:relationship][:product_id]
      flash[:danger] = "Existed !"
      redirect_to products_path
    else
      current_user.products << product
      redirect_to products_path
    end
  end

  def destroy
  end

end
