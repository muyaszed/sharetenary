require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
		@user = User.create(username:"muyaszed", email: 'muyaszed@gmail.com', password: 'abcdef', password_confirmation: 'abcdef')
		@itenary = Itenary.create(title: "My Itenary", user_id: @user.id)
	end

	describe "item creation" do

		it "can be created" do
			
			item = Item.create(day: "1", desc:"Visit the museum")
			expect(item).to be_valid
		end

		it "can't be created without day" do
			
			item = Item.create(desc:"Visit the museum")
			expect(item).to_not be_valid
		end

		it "can't be created without desc" do
			
			item = Item.create(day:"1")
			expect(item).to_not be_valid
		end

	end

	describe "item association" do

		it { should belong_to(:itenary)}

	end

	
end
