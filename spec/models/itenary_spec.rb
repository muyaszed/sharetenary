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

		describe "with bookmarks" do
			it { should have_many(:bookmarks) }
			it { should have_many(:bookmarked).through(:bookmarks).source(:user) }
		end
		
	end

	describe "Itenary instance method" do
		let(:user) {FactoryGirl.create(:user)}
		it "include user in the liking list" do
			@itenary.like(user)
			expect(@itenary.liking_users).to include(user) 
		end

		it "exclude user from liking list" do
			@itenary.like(user)
			@itenary.unlike(user)
			expect(@itenary.liking_users).not_to include(user) 
		end

		it "check user include in the liking list" do
			@itenary.like(user)
			expect(@itenary.like_by?(user)).to be_truthy
		end

		it "include user in the bookmarking list" do
			@itenary.bookmark(user)
			expect(@itenary.bookmarked.include?(user)).to be_truthy 
		end

		it "exclude user from bookmarking list" do
			@itenary.bookmark(user)
			@itenary.unbookmark(user)
			expect(@itenary.bookmarked.include?(user)).to be_falsy 
		end

		it "check user include in the bookmarking list" do
			@itenary.bookmark(user)
			expect(@itenary.bookmarked_by?(user)).to be_truthy
		end
	end
end
