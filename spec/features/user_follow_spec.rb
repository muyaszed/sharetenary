require 'rails_helper'

describe "registed user" do

	before do 
			@first_user = FactoryGirl.create(:user)
			@second_user = FactoryGirl.create(:second_user)
			login_as(@first_user, :scope => :user)
			visit user_profile_path(@second_user, @second_user.profile)
			click_link_or_button 'Follow'
	end

	context 'follow' do
		

		it "can follow another user" do
			
			
			
			expect(@first_user.following.count).to be > 0
		end

		it "can have many follower" do
			
			
			expect(@second_user.followers.count).to be > 0
		end

	end

	context 'unfollow' do
		it " can unfollow" do
			current_count = @first_user.following.count
			visit user_profile_path(@second_user, @second_user.profile)
			click_link_or_button 'Unfollow'
			expect(@first_user.following.count).to be < current_count
		end
	end
	
end