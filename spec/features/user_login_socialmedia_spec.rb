require 'rails_helper'
require_relative '../support/login_form'


feature "user login using social media" do
	let(:login_form) {LoginForm.new}

	context "user never register before" do

		scenario "Facebook" do
			
			login_form.visit_page.mock_auth_hash.social_login("facebook")
			expect(page).to have_content("You are succesfully login using Facebook")
		end

	end

	context "user registered using devise before" do
		scenario "Facebook" do
			user = FactoryGirl.create(:user)
			login_form.visit_page.mock_auth_hash.social_login("facebook")
			expect(page).to have_content("You are succesfully login using Facebook")
		end

	end
end