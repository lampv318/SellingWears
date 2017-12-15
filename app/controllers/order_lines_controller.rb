class OrderLinesController < ApplicationController
  before_action :logged_in_user

  def create
    @order = current_order
    @order_line = @order.order_lines.new order_line_params
    @order_lines = @order.order_lines
    current_line = @order.order_lines.find_by(product_id: @order_line.product_id)
    if current_line
      @order_line.number +=  current_line.number
      @order_lines.find_by(product_id: @order_line.product_id).destroy
    end
    @order.save
    flash[:success] = "Order save"  
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_line = @order.order_lines.find_by id: params[:id]
    @order_line.update_attributes(order_line_params)
    flash[:success] = "Order update"
    @order_lines = @order.order_lines
  end

  def destroy
    @order = current_order
    @order_line = @order.order_lines.find_by id: params[:id]
    @order_line.destroy
    flash[:success] = "Order delete"
    @order_lines = @order.order_lines
  end

  private
  
  def order_line_params
    params.require(:order_line).permit :number, :product_id
  end
end
