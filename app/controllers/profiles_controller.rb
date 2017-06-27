class ProfilesController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		@profile = Profile.find_by_user_id(params[:user_id])
		@bookmarks = @profile.user.bookmarked_itenary.all
		@itenaries = @profile.user.itenaries.all
	end

	def edit

		@profile = Profile.find_by_user_id(params[:user_id])
		@user = @profile.user
	end

	

	


end