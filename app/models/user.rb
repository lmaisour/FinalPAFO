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
	has_many :interests

	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String
	field :password_digest, type: String

	field :is_admin, type: Mongoid::Boolean, default: false

	# INTERESTS SHOULD BE IN INTEREST MODEL 

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

	validates_presence_of :first_name
	validates_uniqueness_of :email
end
