class Interest
	include Mongoid::Document

	belongs_to :users
	belongs_to :events

	# belongs_to :events

	# accepts_nested_attributes_for :events
	# accepts_nested_attributes_for :users

end