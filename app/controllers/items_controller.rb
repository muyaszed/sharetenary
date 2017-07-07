class ItemsController < ApplicationController



	def create
		
		@item = Item.create!(item_params)

		@item.update(day: Item.generate_day(@item.itenary_id, params[:action]))
		byebug
		# @item.generate_day
		# byebug
		# @item.itenary_id = params[:itenary_id]



		respond_to do |format|
			
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

	def update
		@item = Item.find(params[:id])
		respond_to do |format|
	      if @item.update(item_params)
	        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
	        format.json { render :show, status: :ok, location: @item }
	        format.js
	      else
	        format.html { render :edit }
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
    	end

	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		respond_to do |format|
	     
	      format.html { redirect_to @item.itenary, notice: 'Item was successfully updated.' }
	      format.js
	    end
	end

	private

	def item_params
		# params.require(:item).permit(:day, :location, :itenary_id, :sub_item_attributes => [:id, :start_date, :end_date, :attraction, :story, :cost, :_destroy])
		params.require(:item).permit!
	end
end
