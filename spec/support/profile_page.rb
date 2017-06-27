class ProfilePage
	include Capybara::DSL

	def visit_page(user)
		visit("/users/#{user.id}/profiles/#{user.profile.id}")
		self
	end

	def visit_edit_page(user)
		visit("/users/#{user.id}/profiles/#{user.profile.id}/edit")
		self
	end

	def upload_avatar
		attach_file('user[profile_attributes][avatar]', "#{Rails.root}/spec/fixtures/avatar.jpeg" )
		click_on("Update Profile")
		self
	end


end