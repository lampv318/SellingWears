class OrdersController < ApplicationController
  def new
    @order = current_order
  end

  def index
    @user = current_user
    @orders = @user.orders.paginate page: params[:page]
  end

  def show
    if current_order
    @order = current_user.orders.find_by id: params[:id]
    @order_lines = @order.order_lines
    end
  end

  def update
    if current_order.update_attributes order_params
      session.delete :order_id
      redirect_to orders_completed_path
    else
      redirect_to login_path
    end
  end

  def completed
  end

  private

  def order_params
    params.require(:order).permit :address, :state_order_id
  end
end
