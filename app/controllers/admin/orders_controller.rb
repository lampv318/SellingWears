class Admin::OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :require_admin
  
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
      flash[:success] = "Accept"
      redirect_back fallback_location: root_path
    else
      flash[:alert] = "Can't Accept"
      redirect_to root_path
    end
  end

  private 

  def order_params
    params.require(:order).permit :state_order_id
  end
end
