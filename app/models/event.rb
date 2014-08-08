class Event
  include Mongoid::Document

  field :name, type: String
  field :place, type: String
  field :when, type: String
  field :price, type: Integer
  field :participants, type: Integer
  field :short_description, type: String
  field :description, type: String

  
  has_many :users
end
