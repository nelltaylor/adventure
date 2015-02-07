FactoryGirl.define do
	factory :user, aliases: [:author, :commenter, :replier, :voter] do
		 sequence (:email) {|n| "person#{n}@example.com"}
  end

		username: "test"
		email
		password: "password"
end