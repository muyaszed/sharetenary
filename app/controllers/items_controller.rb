class ItemsController < ApplicationController
	def create
		
		@item = Item.create(item_params)
		@item.itenary_id = params[:itenary_id]



		respond_to do |format|
			# byebug
			if @item.save
				# format.html { redirect_to @item.itenary, notice: 'Comment was successfully created.' }
				format.js 
			else
				format.html {redirect_to itenary_path(params[:itenary_id])}
			end 
		end
	end

	def show

	end

	private

	def item_params
		params.require(:item).permit(:day, :desc)
	end
end
