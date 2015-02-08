FactoryGirl.define do
	factory :comment do
		text "New test post"
		commenter
		post
		reply
		vote
	end
end