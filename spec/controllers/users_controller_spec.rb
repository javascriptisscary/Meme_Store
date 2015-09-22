require 'rails_helper'

describe UsersController, :type => :controller do
  
  
    before do
      
     
      end
    
   
   describe "GET #show" do
    
# no login. Redirect to login page

    
    
     context "No user is logged in" do
         
       it "redirects to login" do
         @user1 = build(:user, email: "example@example.com", password:   "12345678", id: 1)
         get :show, id: @user1.id
         expect(response).to redirect_to(new_user_session_path)
         #expect(response).to have_http_status(302)
       end
    end




# user logged in. get #show
    


      context "User is logged in" do
        
        
        it "loads correct user details" do
        @user2 = create(:user, id: 10)
        sign_in @user2
        get :show, id: @user2.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user2
        
        end
      end
    
    end    
end







