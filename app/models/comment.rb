class Comment <ActiveRecord::Base

  acts_as_votable

  belongs_to :post
  has_many :replies
  belongs_to :commenter, class_name: "User"

end
