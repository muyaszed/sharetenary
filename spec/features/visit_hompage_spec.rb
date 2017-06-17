require 'rails_helper'

describe 'Navigate' do

	context "Guest user" do	
    describe 'visit homepage' do
      it 'can be reached successfully' do
        visit root_path
        expect(page.status_code).to eq(200)
      end
   

    
    	it 'has a login link' do
    		visit root_path
    		expect(page).to have_css('#signin-button')
    	end
   

    
    	it 'has a signup link' do
    		visit root_path
    		expect(page).to have_content('Sign up')
    	end

      it 'has facebook signup/login link' do
        visit root_path
        expect(page.find('#facebook-signin')).to be_truthy
      end

      it 'has twitter signup/login link' do
        visit root_path
        expect(page.find('#twitter-signin')).to be_truthy

      end

      it 'has instagram signup/login link' do
        visit root_path
        expect(page.find('#insta-signin')).to be_truthy

      end

    end
    
  end

  context 'Authenticated user' do

    describe 'visit homepage' do
    	it 'has a sign out link' do
    		user = FactoryGirl.create(:user)
    		login_as(user, :scope => :user)
    		visit root_path
    		expect(page).to have_content('Sign out')
    	end

    	it 'does not has a sign in link' do
    		user = FactoryGirl.create(:user)
    		login_as(user, :scope => :user)
    		visit root_path
    		expect(page).not_to have_css('#signin-button')
    	end

      it "has a new itenarary button" do
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
        visit root_path
        expect(page).to have_css('#new-itenarary-button')
      end
    end

  	
  end

  describe "user sign in" do
    it "can sign in using username" do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "Login", with: user.username
      fill_in "Password", with: user.password
      click_link_or_button 'Sign in'
      expect(page).to have_content('Sign out')
    end

    it "can sign in using email" do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "Login", with: user.email
      fill_in "Password", with: user.password
      click_link_or_button 'Sign in'
      expect(page).to have_content('Sign out')
    end
  end

end


