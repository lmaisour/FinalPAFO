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
		@user = User.new(params.require(:user).permit(:image, :first_name, :last_name, :password, :password_confirmation, :email, :mac, :pc, :iphone, :android, :democrat, :republican, :starWars, :starTrek, :coke, :pepsi, :teamJacob, :teamEdward, :harrypotter, :gameofthrones))
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

		if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :email))
			redirect_to users_path
		else 
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end
end