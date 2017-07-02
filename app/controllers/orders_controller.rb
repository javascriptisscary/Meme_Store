class OrdersController < ApplicationController
  protect_from_forgery except: :index
  before_filter :authenticate_user!
   
  def index()
    @orders = Order.all
    @user = current_user
  end
    
  private

  def product_params
    params.require(:order).permit(:id, :user_id, :product_id, :total, :order_id)
  end

end