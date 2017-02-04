require 'rails_helper'

describe 'Navigate' do

  before do
  	@user = FactoryGirl.create(:user_with_itenaries)
  	login_as(@user, :scope => :user)
  end

		
  context 'registered user' do

  	it "can create itenary" do
  		visit new_itenary_path
  		fill_in "Title", with: 'Visit Korea'
  		click_link_or_button "Create"
  		expect(page).to have_content('Visit Korea')
  		
  	end

  	it "can create item from itenary" do
  		visit itenary_path(@user.itenaries.first.id)
      click_link_or_button "New Item"
      fill_in "Day", with: "1"
      fill_in "Description", with: "Time to eat"
      click_link_or_button "Create"
      expect(page).to have_content("Time to eat")
  	end

    

  end

  context 'unregistered user' do
    it "can't create itenary" do
      logout
      visit new_itenary_path
      expect(current_path).to eq(new_user_session_path)
    end
  end


end