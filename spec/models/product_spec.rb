require 'rails_helper'

  describe Product do
    
    #testing avg ratings
    context  "when the product has comments" do
      before do
        @product = Product.create(:name => "funny meme")
        @user = User.create(:email => "email@example.com", :password => "dogggggg")
        @product.comments.create(:rating => 1, :user => @user, :body => "Awful meme!")
        @product.comments.create(:rating => 3, :user => @user, :body => "Avg meme!")
        @product.comments.create(:rating => 5, :user => @user, :body => "Great meme!")
      end

      
    it "Expect the product's average rating to be 3" do
      expect(@product.average_rating).to eq 3
   
    end
  end
    
  
  
  
  #no name. don't pass validations
  
      
    context "Product with description but no name" do
      before do
        @product = Product.create(:description => "meme of all memes")
      end
      
     it "Should not pass validation without name" do
       expect(@product).not_to be_valid
     end 
    end  
    
    
    
    
  end
  

  




