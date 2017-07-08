FactoryGirl.define do 
  factory :post do 
  	date Date.today
  	rationale "Something happened"
  	user
  end 

  factory :second_post, class: "post" do
    date Date.today
    rationale "Some thing bad happened" 
    user
  end 
end 