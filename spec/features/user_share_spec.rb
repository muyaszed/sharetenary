require 'rails_helper'

describe "registed user" do
	before do
	  	@user = FactoryGirl.create(:user_with_itenaries)
	    @itenary = @user.itenaries.first
	  	login_as(@user, :scope => :user)
	  end


	it 'can share itinerary' do
		visit itenary_path(@itenary)
		
		expect(page).to have_css(".social-share-button")
	end

	
end