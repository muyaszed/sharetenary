class FollowsController < ApplicationController

	def follow_user
		
		@followed_user = User.find(params[:user_id])
		if current_user.follow @followed_user
			
	      respond_to do |format|
	        format.html { redirect_to user_profile_path(@followed_user, @followed_user.profile) }
	        format.js
	      end
	    end
	end

	def unfollow_user

		@followed_user = User.find(params[:user_id])
		if current_user.unfollow @followed_user
		  respond_to do |format|
	        format.html { redirect_to user_profile_path(@followed_user, @followed_user.profile) }
	        format.js
	      end
	    end
	end

end
