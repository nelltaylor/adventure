require 'rails_helper'

RSpec.describe Reply, type: :model do
  it { should belong_to(:comment) }
  it { should belong_to(:replier) }
end
