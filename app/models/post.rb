class Post < ActiveRecord::Base

	belongs_to :author, class_name: 'User'
	has_many :comments
	has_many :post_tags
	has_many :tags, through: :post_tags
  has_many :votes, :as => :votable

  def total_votes
    self.votes.where(vote:true).count - self.votes.where(vote:false).count
  end

end
