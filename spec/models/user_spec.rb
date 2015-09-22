require "rails_helper"

describe User do
  context "User email address present" do
    
    before do
      @user = build(:user)
    end
    
    it "sees email address" do
      expect(@user.email).to eq "example@example.com"
    end
    
  end
end