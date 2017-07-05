@user = User.create(email: "test@example.com", password: "samson20",
                      password_confirmation: "samson20", first_name: "jon", last_name: "snow")


puts 'One user was created'
10.times do  |post| 
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "10 posts where created"