FactoryGirl.define do
	sequence (:email) {|n| "person#{n}@example.com"}

	factory :user, aliases: [:author, :commenter, :replier, :voter] do
		username "test"
		email
		password "password"
	end
end