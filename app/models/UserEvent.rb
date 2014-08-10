class UserEvent
	include Mongoid::Document

  belongs_to :events
  belongs_to :team
  field :score, :type => Integer