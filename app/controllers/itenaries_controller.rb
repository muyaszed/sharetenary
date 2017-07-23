class ItenariesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :udate, :destroy]

	def new 
		@itenary = Itenary.new
	end

	def index
		@itenaries = Itenary.all
	end

	def show 
		@itenary = Itenary.find(params[:id])
		@item = Item.new(day: Item.generate_day(@itenary.id, params[:action]))
		gon.currentURL = request.original_url
		@items = @itenary.items.order(created_at: :asc).all
		gon.currentItems = @items
		respond_to do |format|
			format.html
			format.pdf do
				render pdf: "my vacation",
				template: "itenaries/show.html.erb",
				layout: 'pdf.html'
				

			end
		end
		
		
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
