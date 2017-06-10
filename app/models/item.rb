class Item < ApplicationRecord
	validates :day, :desc, :presence => true
	belongs_to :itenary



	

	
end


