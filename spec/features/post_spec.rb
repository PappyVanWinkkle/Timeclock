require 'rails_helper'

describe 'navigate' do 
	before do 
	  @user = FactoryGirl.create(:user)
	  login_as(@user, :scope => :user)
	end 

	describe 'index' do 
		before do 
	      visit posts_path		
		end 
		it 'can be reached successfully' do 
			expect(page.status_code).to eq(200)
		end 

		it 'has a title of posts' do 
			visit posts_path
			expect(page).to have_content(/Posts/)
		end 

		it "has a list of posts to view" do 
			post1 = FactoryGirl.create(:post)
			post2 = FactoryGirl.create(:second_post)
			visit posts_path
			expect(page).to have_content(/post1|post2/)
		end 
	end

	describe 'new' do 
	  it 'has a link to the home page' do 
         visit root_path
         click_link("new_post_from_nav")
         expect(page.status_code).to eq(200)
	  end 
	end 

	describe 'creation' do 
		before do
		  visit new_post_path
		end 

		it 'has a new form that can be reached' do 
			expect(page.status_code).to eq(200)
		end 

		it 'can be created from new form page' do 
			visit new_post_path
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "something nice"
			click_on "save"
			expect(page).to have_content("something nice ")
		end 

		it 'will have a user associated with it ' do 
		    fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "User Association"
			click_on "save"	
			expect(User.last.posts.last.rationale).to eq("User Association")
		end 
	end 
	describe 'edit' do 
	  before do 
	  	@post = FactoryGirl.create(:post)
	  end	
	  it 'can be reached by clicking the index page ' do 
	  	visit posts_path
	  	click_link("edit_#{@post.id}")
	  	expect(page.status_code).to eq(200)
	  end 
	  it 'can be edited' do 
	  	visit edit_post_path(@post)
	  	fill_in 'post[date]', with: Date.today
	  	fill_in 'post[rationale]', with: "Made some changes"
	  	click_on "Save"
	  	expect(page).to have_content("Edited content")
	  end 
	end 
end