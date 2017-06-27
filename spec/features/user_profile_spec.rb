require 'rails_helper'
require_relative '../support/login_form'
require_relative '../support/profile_page'

feature "visit profile page" do
	let(:user) {FactoryGirl.create(:user)}
	let(:other_user) {FactoryGirl.create(:user)}
	let(:login_form) {LoginForm.new}
	let(:profile_page) {ProfilePage.new}

	

		scenario "own profile " do
			login_form.visit_page.sign_in(user)
			profile_page.visit_page(user)

			expect(page).to have_css("#user-following")
			expect(page).to have_css("#user-followers")
			expect(page).to have_css("#user-itenary-list")
			expect(page).to have_css("#user-bookmarked-list")
			expect(page).to have_css("#user-avatar")
			expect(page).to have_css("#edit-profile-button")
			expect(page).not_to have_css(".follow-button")

		end

		scenario "other user profile" do
			login_form.visit_page.sign_in(user)
			profile_page.visit_page(other_user)
			expect(page).to have_css("#user-following")
			expect(page).to have_css("#user-followers")
			expect(page).to have_css("#user-itenary-list")
			expect(page).not_to have_css("#user-bookmarked-list")
			expect(page).not_to have_css("#user-upload-button")
			expect(page).to have_css("#user-avatar")
			expect(page).to have_css(".follow-button")

		end

		# scenario "user can upload avatar image" do
		# 	login_form.visit_page.sign_in(user)
		# 	profile_page.visit_page(user).upload_avatar
			
		# 	expect(page).to have_content("You have uploaded your avatar sucessfully")
			
		# 	expect(user.reload.profile.avatar_identifier).to eq("avatar.jpeg")

		# end

		scenario "user can edit profile" do
			login_form.visit_page.sign_in(user)
			profile_page.visit_edit_page(user).upload_avatar
			
			expect(page).to have_content("You have updated your profile successfully")
			
			expect(user.reload.profile.avatar_identifier).to eq("avatar.jpeg")

		end
	

	

end