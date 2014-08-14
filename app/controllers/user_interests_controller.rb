class User_InterestsController < ApplicationController

def index
	@user_interests = User_Interests.all
end

def create
	u = User_Interests(user_interests_id: params[:user_interests_id],user: current_user)
end









end
