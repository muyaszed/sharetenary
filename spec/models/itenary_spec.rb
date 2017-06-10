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

		describe "with user" do

			it { should belong_to(:user)}

		end

		describe "with items" do

			it { should have_many(:items)}

		end

		describe "with likes" do

			it {should have_many(:likes)}
			it {should have_many(:liking_users).through(:likes).source(:user)}
		end
		
	end
end
