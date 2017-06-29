require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do 
  	before do 
  		@user = User.create(email: "test@gmail.com", password: "samson20", 
  			     password_confirmation: "samson20", first_name: "John", last_name: "Michael")
  	end 
  	it "can be created" do 	
  		expect(@user).to be_valid
  	end 
  	it "cannot be created without first_name, last_name" do 
  		expect(@user).to be_valid 
  	end 
  end 
end
