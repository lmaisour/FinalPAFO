class SessionsController < ApplicationController
	def new
		@user = User.new
		@is_login = true
	end

	def create
		u = User.where(email: params[:user][:email]).first
		# first make sure we actually find a user
		# then see if user authenticates
		if u && u.authenticate(params[:user][:password])
			# sets the cookie to the browser
			session[:user_id] = u.id.to_s
			if u.is_admin == true
				redirect_to events_path
			else
				redirect_to users_path
			end

		else
			redirect_to new_sessions_path
		end
	end


def destroy
		# Kill our cookies!
		reset_session
		redirect_to root_path
	end
end