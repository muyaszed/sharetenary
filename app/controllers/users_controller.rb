class UsersController < ApplicationController
  

  def show
  	@user = User.find(params[:id])
  end

  def update
  	
  	@user = User.find(params[:id])

  	if @user.update(user_params)
  		
  		redirect_to user_profile_path(@user, @user.profile.id), notice: "You have updated your profile sucessfully"
	else
		 
		redirect_to edit_user_profile_path(@user.id, @user.profile.id), :flash => {:error => @user.errors.full_messages}
		

	end

  end

  def first_time_edit_password
  	@user = User.find(current_user.id)
  end

  def first_time_update_password

  	@user = User.find(current_user.id)
  	
  	if @user.update(user_params)
  		bypass_sign_in(@user)
      @user.first_time_password_changed = true
      @user.save
  		redirect_to root_path, notice: "You have succesfully registered as a user."
  	else
  		
  		flash[:error] = @user.errors.full_messages
  		render first_time_edit_password_users_path 

  	end

  end

  


  private

  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_attributes => [:id, :avatar])
  end
end
