# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do 
	Post.new(title: Faker::Hacker.say_something_smart,
					image_url: 'http://lorempixel.com/300/200/animals/',
					author_id: rand(1..50))
end

25.times do
	User.new(username: Faker::Internet.user_name,
           email: Faker::Internet.email,
           password: Faker::Internet.password)
end

25.times do
	Vote.new(votable_id: 1, votable_type: Post )
end