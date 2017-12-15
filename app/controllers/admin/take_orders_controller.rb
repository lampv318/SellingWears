class Admin::TakeOrdersController < ApplicationController
  def index
    @orders = Order.all
  end
end
