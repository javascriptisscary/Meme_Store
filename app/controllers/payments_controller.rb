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
        :description => params[:stripeEmail]
        
        
        
    )
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
    #redirect to order confirm eventually
    redirect_to product_path(@product)
  end
end


