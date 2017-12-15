class Shipper::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by id: params[:id]
    @order_lines = @order.order_lines 
  end

end
