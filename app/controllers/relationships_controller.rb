class RelationshipsController < ApplicationController

  def create
     product = Product.find params[:relationship][:product_id]
    if current_user.products << product
      redirect_to products_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

end
