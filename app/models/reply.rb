class Reply < ActiveRecord::Base
	acts_as_votable
	
	belongs_to :comment
	belongs_to :replier, class_name: 'User'

end
