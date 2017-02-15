require 'rails_helper'

describe "registed user" do
	before do
	  	@user = FactoryGirl.create(:user_with_itenaries)
	    @user2 = FactoryGirl.create(:second_user_with_itenaries)
	    @itenary = @user2.itenaries.first

	  	login_as(@user, :scope => :user)
	  end


	it 'can like itinerary' do
		current_like = @itenary.liking_user.count
		visit itenary_path(@itenary)
		click_link_or_button 'LIKE'
		expect(@itenary.liking_user.count).to be > current_like
	end

	it 'can unlike itinearary' do
		
		visit itenary_path(@itenary)
		click_link_or_button 'LIKE'
		current_like = @itenary.liking_user.count
		click_link_or_button 'UNLIKE'
		expect(@itenary.liking_user.count).to be < current_like
	end
end