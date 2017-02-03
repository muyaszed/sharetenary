class Item < ApplicationRecord
	validates :day, :desc, :presence => true
end
