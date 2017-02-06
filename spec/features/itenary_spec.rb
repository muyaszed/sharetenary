require 'rails_helper'

describe 'Navigate' do

  before do
  	@user = FactoryGirl.create(:user_with_itenaries)
    @user2 = FactoryGirl.create(:second_user_with_itenaries)
  	login_as(@user, :scope => :user)
  end

		
  context 'registered user' do

  	it "can create itenary" do
  		visit new_itenary_path
  		fill_in "Title", with: 'Visit Korea'
  		click_link_or_button "Create"
  		expect(page).to have_content('Visit Korea')
  		
  	end

  	it "can create item from own itenary" do
  		visit itenary_path(@user.itenaries.first.id)
      click_link_or_button "New Item"
      fill_in "Day", with: "1"
      fill_in "Description", with: "Time to eat"
      click_link_or_button "Create"
      expect(page).to have_content("Time to eat")
      # expect(@user.itenaries.first.items.last.desc).to eq("Time to ea")
  	end

    it 'can edit own item' do
      item = Item.create(day: 1, desc: "Time to eat", itenary_id: @user.itenaries.first.id)
      visit itenary_path(@user.itenaries.first.id)
      click_link_or_button("Edit Item")
      
      # find("#edit-item-form-#{item.id}") 
        fill_in "Descriptio", with: "Time to sleep"
        # find_by_id("submit-edit", visible: false).click
      
      
      # click_link_or_button "Update"
      expect(page).to have_content("Day")
      # expect(page).to have_field("item[desc]", with: "Time to eat")
    end

    it "can't create item from other user" do
      visit itenary_path(@user2.itenaries.first.id)
      expect(page).to_not have_content("New Item")
    end
    
    it "can't edit item from other user" do
      item = Item.create(day: 1, desc: "Time to eat", itenary_id: @user2.itenaries.first.id)
      visit itenary_path(@user2.itenaries.first.id)
      expect(page).to_not have_content("Edit Item")
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