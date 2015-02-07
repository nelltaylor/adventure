# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
	Post.create!(title: Faker::Hacker.say_something_smart,
					image_url: 'http://lorempixel.com/300/200/animals/',
					author_id: rand(1..20))
end

20.times do
	User.create!(username: Faker::Internet.user_name,
           email: Faker::Internet.email,
           password: "password")
end


70.times do
	PostTag.create!(post_id:rand(1..20), tag_id:rand(1..20))
end

20.times do
	Comment.create!(text: Faker::Hacker.say_something_smart, commenter_id: rand(1..20), post_id: rand(1..20))
end

20.times do
	Reply.create!(text: Faker::Hacker.say_something_smart, replier_id: rand(1..20), comment_id: rand(1..20))
end

70.times do
	Tag.create!(name: Faker::Hacker.noun)
end
