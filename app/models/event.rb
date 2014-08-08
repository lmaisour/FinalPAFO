class Event
  include Mongoid::Document

  field :name, type: String
  field :place, type: String
  field :when, type: String
  field :price, type: Integer
  field :participants, type: Integer

  has_many :users
end
