class UserEvent
	include Mongoid::Document

  belongs_to :user
  belongs_to :event
  end
