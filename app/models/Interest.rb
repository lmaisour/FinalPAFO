class Interest
	include Mongoid::Document

	has_many :users
	has_many :events

	accepts_nested_attributes_for :events
	accepts_nested_attributes_for :users

	field :mac, type: Mongoid::Boolean
	field :pc, type: Mongoid::Boolean

	field :iphone, type: Mongoid::Boolean
	field :android, type: Mongoid::Boolean

	field :democrat, type: Mongoid::Boolean
	field :republican, type: Mongoid::Boolean

	field :starWars, type: Mongoid::Boolean
	field :starTrek, type: Mongoid::Boolean

	field :coke, type: Mongoid::Boolean
	field :pepsi, type: Mongoid::Boolean

	field :teamJacob, type: Mongoid::Boolean
	field :teamEdward, type: Mongoid::Boolean

	field :harrypotter, type: Mongoid::Boolean
	field :gameofthrones, type: Mongoid::Boolean

	field :fox, type: Mongoid::Boolean
	field :cnn, type: Mongoid::Boolean

	field :chocolate, type: Mongoid::Boolean
	field :vanilla, type: Mongoid::Boolean

	field :frontend, type: Mongoid::Boolean
	field :backend, type: Mongoid::Boolean
end