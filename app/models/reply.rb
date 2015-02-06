class Reply < ActiveRecord::Base

	belongs_to :comment
	belongs_to :replier, class_name: 'User'
  has_many :votes, :as => :votable

  def total_votes
    self.votes.where(vote:true).count - self.votes.where(vote:false).count
  end

end
