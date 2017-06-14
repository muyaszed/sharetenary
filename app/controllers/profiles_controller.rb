class ProfilesController < ApplicationController
	before_action :authenticate_user!, only: [:show]

	def show
		@profile = Profile.find_by_user_id(params[:user_id])
		@bookmarks = @profile.user.bookmarked_itenary.all
		@itenaries = @profile.user.itenaries.all
	end

	def update
		@profile = Profile.find_by_user_id(params[:user_id])
		if @profile.update(profile_params)
			
			redirect_to user_profile_path(@profile.user.id, @profile), notice: "You have uploaded your avatar sucessfully"
		else
			rendirect_to user_profile_path(@profile.user.id, @profile), alert: "You failed to upload suceessfully"
		end
	end

	private

	def profile_params
		params.require(:profile).permit(:avatar)
	end


end