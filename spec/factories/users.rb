FactoryGirl.define do 
  sequence :email do |n| 
    "test#{n}@example.com"
    end	

  factory :user do 
  	first_name "JON"
  	last_name "SNOW"
  	email { generate :email }
  	password "samson20"
  	password_confirmation "samson20"
  end 


  factory :admin_user, class: "AdminUser" do 
  	first_name "Mike"
  	last_name "Golang"
  	email { generate :email}
  	password "samson20"
  	password_confirmation "samson20"
  end 
end 