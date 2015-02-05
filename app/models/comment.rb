class Comment <ActiveRecord::Base

  acts_as_votable

  belongs_to :commenter, class_name: "User"
  belongs_to :post
  has_many :replies

end
