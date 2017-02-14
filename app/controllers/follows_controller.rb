class FollowsController < ApplicationController

	def follow_user
		@followed_user = User.find(params[:id])
		if current_user.follow @followed_user
			
	      respond_to do |format|
	        format.html { redirect_to user_path(params[:id]) }
	        format.js
	      end
	    end
	end

	def unfollow_user
		@followed_user = User.find(params[:id])
		if current_user.unfollow @followed_user
		  respond_to do |format|
	        format.html { redirect_to user_path(params[:id]) }
	        format.js
	      end
	    end
	end

end
