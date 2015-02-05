require 'rails_helper'

RSpec.describe Post, type: :model do
	it { should belong_to(:author) }
	it { should have_many(:comments) }
	it { should have_many(:post_tags) }
	it { should have_many(:tags) }
end
