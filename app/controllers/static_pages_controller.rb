class StaticPagesController < ApplicationController
 
 def landing_page
      @products = Product.limit(5)
      @user =current_user
 end
 
  def index
     @user =current_user
  end
  
  def about
   @user =current_user
  end
  
  def thank_you
  @user =current_user
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  UserMailer.contact_form(@email, @name, @message).deliver
  end
end
