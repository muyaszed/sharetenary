class BookmarksController < ApplicationController
	before_action :authenticate_user!, only: [:bookmark_itenary, :unbookmark_itenary]
	def bookmark_itenary

		@itenary = Itenary.find(params[:id])
		if @itenary.bookmark current_user
			
	      respond_to do |format|
	        format.html { redirect_to itenary_path(params[:id]) }
	        format.js
	      end
	    end

	end

	def unbookmark_itenary
		@itenary = Itenary.find(params[:id])
	  	if @itenary.unbookmark current_user
				
		      respond_to do |format|
		        format.html { redirect_to itenary_path(params[:id]) }
		        format.js
		      end
		end
	end
end
