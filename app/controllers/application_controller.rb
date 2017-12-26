class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_order
  include ApplicationHelper  

  private

  def require_shipper
    unless current_user.shipper?
      flash[:danger] = "You are not Shipper"
      redirect_to root_path
    end
  end

  def require_admin
    unless current_user.is_admin?
      flash[:danger] = "You are Not Admin ."
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
    else
      redirect_to login_path
    end
  end
end
