class CartsController < ApplicationController
  def show
    @order_lines = current_order.order_lines
  end
end
