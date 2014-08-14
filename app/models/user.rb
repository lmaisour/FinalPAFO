class User
	include Mongoid::Document
	include ActiveModel::SecurePassword
	include Mongoid::Paperclip


    # FOR UPLOADING IMAGES #

    has_mongoid_attached_file :image, 
    :styles => { 
    	:medium   => ['250x250',    :jpg]
    }
    validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	# TO ESTABLISH PASSWORD? 
	has_secure_password


	# FIELDS WITIN THE MODEL
	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String
	field :password_digest, type: String
	# "SPECIAL" FIELD TO ALLOW ADMIN ACCESS
	field :is_admin, type: Mongoid::Boolean, default: false

	#VALIDATES FIELDS TO BE PRESENT AND UNIQUE
	validates_presence_of :first_name
	validates_uniqueness_of :email

	# TO CREATE DATABASE RELATIONSHIP
	has_many :events


	def events
      Event.find event_ids
    end


    def event_ids
      event_ids_array = []
      self.user_event.each do |s|
        if s.event_id
          event_ids_array.push s.detail_id
        end 
      end
      event_ids_array 
    end

    def event_ids=(list)
      self.user_event.destroy
      list.each do |event_id|
        self.user_event.create(event_id: event_id)
      end
    end

    # some way of showing a list
    def event_list
      event_string = ""
      events.each do |one_detail|
        event_string += ", " + one_detail.name
      end
      events_string.slice(2,events_string.length - 1)
      events_string
    end

end
