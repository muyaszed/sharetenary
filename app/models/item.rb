class Item < ApplicationRecord
	validates :day, :desc, :presence => true
	belongs_to :itenary
	have_many :sub_items, dependent: :destroy



	

	
end


