class EventsController < ApplicationController
	before_action :check_admin, only: [:new, :edit, :create, :destroy, :update]

	def index
		@events = Event.all
		@attendees = Event.attendees 
	end


	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params.require(:event).permit(:image, :name, :place, :when, :price, :participants, :short_description, :description))
		if @event.save 
			redirect_to events_path
		else
			render 'new'
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(params[:product])
			redirect_to event_path(@event)
		else
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end

  	def attend
	    @event = Event.find(params[:id].to_s)
	    Attendee.create(user_id: current_user.id, event_id: @event.id)
	    redirect_to @event
  	end

  	def business
	    parameters = { term: params[:term], limit: 16 }
	    render json: Yelp.client.business('Los Angeles', parameters)
  	end


	private 

	def check_admin
		unless current_user && current_user.is_admin
			redirect_to events_path
		end
	end
end
