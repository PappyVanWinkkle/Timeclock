require 'rails_helper'
RSpec.describe User, type: :model do
  before do 
   @user = User.create(email: "test@gmail.com", password: 
                       "samson11", password_confirmation: "samson11", first_name: "John", last_name: "snow")  
  end 

  describe "creation" do 

    it "can be created" do 
      expect(@user).to be_valid
    end 

    it "cannot be created without first name and last name" do
      @user.first_name =  nil 
      @user.last_name = nil 
      expect(@user).to_not be_valid 
    end 
  end 

  describe "custom name methods" do 
    it "has a full name method that combines the first name and last name" do
      expect(@user.full_name).to eq("SNOW JOHN")
    end 
  end 

  end 