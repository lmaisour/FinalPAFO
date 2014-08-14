class User
	include Mongoid::Document
	include ActiveModel::SecurePassword
    include Mongoid::Paperclip

	has_mongoid_attached_file :image, 
	:styles => { 
		:medium   => ['250x250',    :jpg]
	}

	validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	

	has_secure_password


	has_many :events

	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String
	field :password_digest, type: String

	field :is_admin, type: Mongoid::Boolean, default: false


	validates_presence_of :first_name
	validates_uniqueness_of :email
end
