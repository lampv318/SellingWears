class OrdersController < ApplicationController
  def new
    @order = current_order
  end

  def index
    @user = current_user
    @orders = @user.orders.paginate page: params[:page]
  end

  def show
    @order = current_user.orders.find_by id: params[:id]
    @order_lines = @order.order_lines
  end

  def update
    if current_order.update_attributes order_params
      session.delete :order_id
      redirect_to root_path
    else
      redirect_to cart_path
    end
  end

  private

  def order_params
    params.require(:order).permit :address, :state_order_id
  end
end
