class CartsController < ApplicationController

  def new
    @cart = current_cart
    if @cart.cart_items.empty?
      flash[:danger] = 'Your cart is empty'
      redirect_to root_path
      return
    end
    @order = Order.new
  end

  def show
    @order_lines = current_order.order_lines
  end
end
