class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  include ApplicationHelper  

  private

  def require_admin
    unless current_user.is_admin?
      flash[:danger] = t "Not Admin"
      redirect_to root_path
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please Login"
      redirect_to root_path
    end
  end

  def current_order
    if logged_in?
      if session[:order_id]
        Order.find(session[:order_id])
      else
        current_user.orders.new
      end
    end
  end
end
