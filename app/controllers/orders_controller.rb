class OrdersController < ApplicationController
    protect_from_forgery except: :index
    def new()
        @order =Order.new
    end
    
    def create()
         
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