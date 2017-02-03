require 'rails_helper'

describe 'Navigate' do

		
  context 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  context 'Login' do
  	it 'has a login link' do
  		visit root_path
  		expect(page).to have_content('Sign in')
  	end
  end

  context 'Signup' do
  	it 'has a login link' do
  		visit root_path
  		expect(page).to have_content('Sign up')
  	end
  end

  context 'User signin' do
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
  		expect(page).not_to have_content('Sign in')
  	end

  	it "can sign in using username" do
  		user = FactoryGirl.create(:user)
  		visit new_user_session_path
  		fill_in "Login", with: user.username
  		fill_in "Password", with: user.password
  		click_link_or_button 'Log in'
  		expect(page).to have_content('Sign out')
  	end

  	it "can sign in using email" do
  		user = FactoryGirl.create(:user)
  		visit new_user_session_path
  		fill_in "Login", with: user.email
  		fill_in "Password", with: user.password
  		click_link_or_button 'Log in'
  		expect(page).to have_content('Sign out')
  	end
  end

end
