class ProfilePage
	include Capybara::DSL

	def visit_page(user)
		visit("/users/#{user.id}/profiles/#{user.profile.id}")
	end


end