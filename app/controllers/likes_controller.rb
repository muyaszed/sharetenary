class LikesController < ApplicationController
	before_action :authenticate_user!, only: [:like_itenary, :unlike_itenary]
  def like_itenary
  		@itenary = Itenary.find(params[:id])
		if @itenary.like current_user
			
	      respond_to do |format|
	        format.html { redirect_to itenary_path(params[:id]) }
	        format.js
	      end
	    end
  end

  def unlike_itenary
  	@itenary = Itenary.find(params[:id])
  	if @itenary.unlike current_user
			
	      respond_to do |format|
	        format.html { redirect_to itenary_path(params[:id]) }
	        format.js
	      end
	    end
  end
end
