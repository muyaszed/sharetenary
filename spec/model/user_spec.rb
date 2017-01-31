require 'rails_helper'

describe 'User creation' do

	before do

	end
	

	it "can be created" do
		@user = User.create(username:"muyaszed", email: 'muyaszed@gmail.com', password: 'abcdef', password_confirmation: 'abcdef')
		expect(@user).to be_valid
	end

	it "can't be created without username" do
		@user = User.create(email: 'muyaszed@gmail.com',password: 'abcdef', password_confirmation: 'abcdef')
		expect(@user).to_not be_valid
	end 

	it "can't be created without email" do
		@user = User.create(username:"muyaszed",)
		expect(@user).to_not be_valid
	end 

end