class Event
  include Mongoid::Document

  # has_mongoid_attached_file :image 
  # validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  field :name, type: String
  field :place, type: String
  field :when, type: String
  field :price, type: Integer
  field :short_description, type: String
  field :description, type: String
  field :starter1, type: String
  field :starter2, type: String
  field :starter3, type: String
  field :entree1, type: String
  field :entree2, type: String
  field :entree3, type: String
  field :dessert1, type: String
  field :dessert2, type: String
  field :dessert3, type: String
  field :drink, type: String


  
  has_many :attendees

  # accepts_nested_attributes_for :interests
  # accepts_nested_attributes_for :users

  #has_many :users, through: :interests
  def users
    User.find(self.userinterests.map(&:shoe_id))
  end

  def user_ids
    ret = []
    self.interests.each do |r|
      ret << r.user_id if r.user_id
    end
    ret
  end

  def user_ids=(list)
    self.interests.destroy
    list.each do |user_id|
      self.interests.create(user_id: user_id)if user_id
    end
  end

  #has_many :interests, through: :users ?????

  
end
