class Interest
	include Mongoid::Document

	has_many :users
	has_many :events
