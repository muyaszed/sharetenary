require 'rails_helper'

RSpec.describe Itenary, type: :model do

	before do
		@itenary = FactoryGirl.create(:itenary)
		
	end

	it "can be created" do
		
		
		expect(@itenary).to be_valid
	end

	it "can't be created without title" do
		
		@itenary.title = nil
		expect(@itenary).to_not be_valid
	end

	it "has many items" do
		itenary = Itenary.create(title: "Trip to Korea", user_id: "1")
		item1 = Item.create(day: '1', desc: "Visit the museum", itenary_id:itenary.id)
		item2 = Item.create(day: '2', desc: "Visit the mall", itenary_id:itenary.id )
		expect(itenary.items.count).to be > 1
	end
end
