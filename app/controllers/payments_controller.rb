class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = User.find(params[:user_id])
    token = params[:stripeToken]
   
   

    
    
  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail],
        
        
        
    )
      
      @order = Order.create(id: 1, user_id: @user, product_id: @product.id, total: @product.price)
      @order.save

    
     
      
    rescue Stripe::CardError => e
    # The card has been declined
      body = e.json_body
      err = body[:error]
     
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    #redirect to order confirm eventually
    redirect_to user_path(@user)
    
  end
   
   
   happy = charge.id
        logger.debug "charge id = #{happy}"
   
   
   
end


