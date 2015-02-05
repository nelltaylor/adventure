# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
	Post.new(title: Faker::Hacker.say_something_smart,
					image_url: 'http://lorempixel.com/300/200/animals/',
					author_id: rand(1..20))
end

20.times do
	User.new(username: Faker::Internet.user_name,
           email: Faker::Internet.email,
           password: Faker::Internet.password)
end

20.times do
	Vote.new(votable_id: 1, votable_type: Post )
end

20.times do
	Post_tag.new(post_id:rand(1..20), tag_id:rand(1..20))
end

20.times do
	Comment.new(text: Faker::Hacker.say_something_smart, commenter_id: rand(1..20), post_id: rand(1..20))
end

20.times do
	Replies.new(text: Faker::Hacker.say_something_smart, replier_id: rand(1..20), comment_id: rand(1..20))
end

20.times do
	Tags.new(name: Faker::Hacker.noun)
end