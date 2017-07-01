require 'rails_helper'

describe 'navigate' do 
	describe 'index' do 
		it 'can be reached successfully' do 
			visit posts_path
			expect(page.status_code).to eq(200)
		end 
		it 'has a title of posts' do 
			visit posts_path
			expect(page).to have_content(/Posts/)
		end 
	end
	describe 'creation' do 
		it 'has a new form that can be reached' do 
			visit new_post_path
			expect(page.status_code).to eq(200)
		end 
		it 'can be created from new form page' do 
			visit new_post_path
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "something nice"
			click_on "save"
			expect(page).to have_content("something nice ")
		end 
	end 
end