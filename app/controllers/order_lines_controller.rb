class OrderLinesController < ApplicationController
  before_action :logged_in_user

  def create
    @order = current_order
    @order_line = @order.order_lines.new(order_line_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_line = @order.order_lines.find_by id: params[:id]
    @order_line.update_attributes(order_line_params)
    @order_lines = @order.order_lines
  end

  def destroy
    @order = current_order
    @order_line = @order.order_lines.find_by id: params[:id]
    @order_line.destroy
    @order_lines = @order.order_lines
  end

  private
  
  def order_line_params
    params.require(:order_line).permit :number, :product_id
  end
end
