class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		callback_from :facebook
	end



	private

	def callback_from(provider)
		provider = provider.to_s
		
		@user = Authentication.find_for_oauth(request.env['omniauth.auth'])

		if @user.persisted?
			
			if @user.sign_in_count == 0
				sign_in @user
				redirect_to first_time_edit_password_users_path, notice: "Please update your password"
			else
				sign_in_and_redirect @user,  :event => :authentication
				# set_flash_message(:notice, :succes, :kind => provider.capitalize) if is_navigational_format?
				case provider
					when "facebook" 
						flash[:notice] = "You are succesfully login using Facebook"
				

				end
			end
		else
			session["devise.#{provider}_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end

	def failure
		redirect_to root_path
	end
end