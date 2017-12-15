class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
    @order_lines = @order.order_lines
  end

  def update
    @order = Order.find_by id: params[:id]
    if @order.update_attributes order_params
      flash[:success] = "Accpet"
      redirect_back fallback_location: root_path
    else
      flash[:alert] = "Can't Accpet"
      redirect_to root_path
    end
  end

  private 

  def order_params
    params.require(:order).permit :state_order_id
  end
end
