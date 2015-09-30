class OrdersController < ApplicationController
    protect_from_forgery except: :index
    def new()
        @order =Order.new
    end
    
    def create()
          @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to :back, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    end
    
    def index()
        @orders = Order.all
    end
    
    def show
      @orders = Order.all  
    
    end

    def confirm
        #code
    end
    
end