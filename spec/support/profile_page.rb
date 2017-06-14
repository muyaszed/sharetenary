class ProfilePage
	include Capybara::DSL

	def visit_page(user)
		visit("/users/#{user.id}/profiles/#{user.profile.id}")
		self
	end

	def upload_avatar
		attach_file('profile[avatar]', "#{Rails.root}/spec/fixtures/avatar.jpeg" )
		click_on("Update Profile")
		self
	end


end