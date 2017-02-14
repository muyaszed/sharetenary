class FollowsController < ApplicationController

	def follow_user
		@followed_user = User.find(params[:id])
		if current_user.follow @followed_user
			
	      respond_to do |format|
	        format.html { redirect_to root_path }
	        format.js
	      end
	    end
	end

end
