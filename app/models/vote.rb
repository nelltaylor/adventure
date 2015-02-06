class Vote < ActiveRecord::Base

  attr_writer :voter

  belongs_to :votable, polymorphic: :true
  belongs_to :voter, class_name: "User"

end
