class Item < ApplicationRecord
	validates :location, :presence => true
	belongs_to :itenary
	has_many :sub_items, inverse_of: :item, dependent: :destroy
	accepts_nested_attributes_for :sub_items, allow_destroy: true



	def self.generate_day(itenary_id, action)
		count = self.where(itenary_id: itenary_id).count
		if action == "create"
			count 
		else
			count = count +1
		end
	end

	
end


