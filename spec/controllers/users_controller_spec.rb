require 'rails_helper'

describe UsersController, :type => :controller do
  
  
    before do
      @user1 = User.create(email: "example@example.com", password:   "12345678")
      @user2 = User.create(email: "example2@example.com", password:   "12345678")
      sign_in @user2
      end
    
   
   describe "GET #show" do
    
# no login. Redirect to login page

    
    
     context "No user is logged in" do
         
       it "redirects to login" do
         get :show, id: @user1.id
         expect(response).to redirect_to(root_path)
         #expect(response).to have_http_status(302)
       end
    end




# user logged in. get #show
    


      context "User is logged in" do
        
        
        it "loads correct user details" do
       
        get :show, id: @user2.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user2
        
        end
      end
    
    end    
end







