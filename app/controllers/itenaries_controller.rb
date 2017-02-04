class ItenariesController < ApplicationController
	before_action :authenticate_user!, only: [:show, :new, :edit, :udate, :destroy]

	def new 
		@itenary = Itenary.new
	end

	def show 
		@itenary = Itenary.find(params[:id])
		@item = Item.new
		@items = @itenary.items.all
		
		
	end

	def create
		@itenary = Itenary.new(itenary_params)
		@itenary.user_id = current_user.id
		if @itenary.save
			
			redirect_to @itenary, :notice => "Your itenary created successfully"
		else
			render :new
		end
	end


	private

	def itenary_params 
		params.require(:itenary).permit(:title)
	end
end
