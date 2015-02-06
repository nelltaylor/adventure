class Comment <ActiveRecord::Base

  belongs_to :commenter, class_name: "User"
  belongs_to :post
  has_many :replies

end
