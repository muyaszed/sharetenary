class LoginForm
	include Capybara::DSL

	def visit_page
		visit("/")
		self
	end

	def sign_in(user)
		fill_in("Login", with: user.username)
		fill_in("Password", with: user.password)
		click_on("Log in")
		self
	end

end