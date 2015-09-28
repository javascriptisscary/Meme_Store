class OrdersController < ApplicationController
    protect_from_forgery except: :index
    def new()
        #code
    end
    
    def create()
        #code
    end
    
    def index()
        
    end
    
    def show
      @orders = Orders.all  
    
    end

    def confirm
        #code
    end
    
end