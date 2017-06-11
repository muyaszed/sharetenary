require 'rails_helper'

RSpec.describe User, type: :model do
	before do
		@user = FactoryGirl.create(:user_with_itenaries)
	end
	
	describe "User creation" do
		it "can be created" do
			
			expect(@user).to be_valid
		end

		it "can't be created without username" do
			@user.username = nil 
			expect(@user).to_not be_valid
		end 

		it "can't be created without email" do
			@user.email = nil
			expect(@user).to_not be_valid
		end 

		
	end

	describe "User association" do

		describe "with itenaries" do
			it { should have_many(:itenaries) }
		end

		describe "with follows" do
			it { should have_many(:itenaries) }
			it { should have_one(:profile) }
			it { should have_many(:active_follows).class_name('Follow').with_foreign_key('follower_id').dependent(:destroy) }
			it { should have_many(:following).through(:active_follows).source(:followed)}
			it { should have_many(:passive_follows).class_name('Follow').with_foreign_key('followed_id').dependent(:destroy) }
			it { should have_many(:followers).through(:passive_follows).source(:follower)}
		end

		describe "with likes" do
			it { should have_many(:likes)}
			it { should have_many(:liked_itenary).through(:likes).source(:itenary)}

		end

		describe "with bookmarks" do
			it { should have_many(:bookmarks)}
			it { should have_many(:bookmarked_itenary).through(:bookmarks).source(:itenary)}
		end
	end

	describe "User method" do
		it "create profile when user register" do
			expect(@user.profile).to be_valid
		end

		it "follows user" do
			second_user = FactoryGirl.create(:user)
			@user.follow(second_user)
			expect(@user.following.include?(second_user)).to be_truthy
		end

		it 'unfollows user' do
			second_user = FactoryGirl.create(:user)
			@user.follow(second_user)
			@user.unfollow(second_user)
			expect(@user.following.include?(second_user)).to be_falsy
		end

		it "checks if user is a follower to other user" do
			second_user = FactoryGirl.create(:user)
			@user.follow(second_user)
			expect(@user.following?(second_user)).to be_truthy
		end
	end

end

