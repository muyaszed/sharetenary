require 'rails_helper'

describe "registed user" do
	before do
	  	@user = FactoryGirl.create(:user_with_itenaries)
	    @user2 = FactoryGirl.create(:second_user_with_itenaries)
	    @itenary = @user2.itenaries.first

	  	login_as(@user, :scope => :user)
	  end


	it 'can bookmark itinerary' do
		current_bookmarked = @itenary.bookmarked.count
		visit itenary_path(@itenary)
		click_link_or_button 'BOOKMARK'
		expect(@itenary.bookmarked.count).to be > current_bookmarked
	end

	it 'can unbookamrk itinearary' do
		
		visit itenary_path(@itenary)
		click_link_or_button 'BOOKMARK'
		current_bookmarked = @itenary.bookmarked.count
		click_link_or_button 'UNBOOKMARK'
		expect(@itenary.bookmarked.count).to be < current_bookmarked
	end
end