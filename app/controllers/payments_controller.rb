class PaymentsController < ApplicationController
  
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    
  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @product.price, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
        )
      
      
      if (charge.paid == true)
      @order = Order.create(user_id: @user.id, product_id: @product.id, total: @product.price, order_id: charge.id)
      @order.save
      end
        
    rescue Stripe::CardError => e
    # The card has been declined
      body = e.json_body
      err = body[:error]
      
      puts "Status is: #{e.http_status}"
      puts "Type is: #{err[:type]}"
      puts "Code is: #{err[:code]}"
      # param is '' in this case
      puts "Param is: #{err[:param]}"
      puts "Message is: #{err[:message]}"
     
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  end
    
end


