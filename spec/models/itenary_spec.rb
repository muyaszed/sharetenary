require 'rails_helper'

RSpec.describe Itenary, type: :model do

	before do
		@itenary = FactoryGirl.create(:itenary)
		
	end

	describe "Iteenary creation" do

		it "can be created" do
			
			
			expect(@itenary).to be_valid
		end

		it "can't be created without title" do
			
			@itenary.title = nil
			expect(@itenary).to_not be_valid
		end
	end

	describe "Itenarary associations" do

		it { should belong_to(:user)}

		it { should have_many(:items)}

		
	end
end
