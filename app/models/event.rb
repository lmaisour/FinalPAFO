class Event
  include Mongoid::Document

  # has_mongoid_attached_file :image 
  # validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  field :name, type: String
  field :place, type: String
  field :when, type: String
  field :price, type: Integer
  field :participants, type: Integer
  field :short_description, type: String
  field :description, type: String

  
  has_many :users
end
