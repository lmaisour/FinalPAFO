class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		# @id = params[:id]
		# @user = User.find(@id)
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
		@is_signup = true
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			redirect_to events_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :email, :image))
			redirect_to users_path
		else 
			render 'edit'
		end
	end



	private

	def user_params
	    params.require(:user).permit(:is_admin, :image, :first_name, :last_name, :password, :password_confirmation, :email, event_ids: [])
	end


end