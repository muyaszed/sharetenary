class LoginForm
	include Capybara::DSL

	def visit_page
		visit("/")
		self
	end

	def sign_in(user)
		fill_in("Login", with: user.username)
		fill_in("Password", with: user.password)
		click_on("Sign in")
		self
	end

	def mock_auth_hash

	    # The mock_auth configuration allows you to set per-provider (or default)
	    # authentication hashes to return during integration testing.
	    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({

		  :provider => 'facebook',
		  :uid => '123545',
		  :info => {
		  	:name => 'mockuser',
		  	:email => 'mockemail@test.com'
		  }
		  # etc.
		})

	    self
	  end

	def social_login(name)
		case name
		when "facebook"
			click_on("Facebook")
		

		end
	end

end