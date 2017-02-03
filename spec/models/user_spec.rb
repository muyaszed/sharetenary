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

	it "has many itenaries" do
		@user = User.create(username:"muyaszed", email: 'muyaszed@gmail.com', password: 'abcdef', password_confirmation: 'abcdef')
		itenary1 = Itenary.create(title: "My Itenary", user_id: @user.id)
		itenary2 = Itenary.create(title: "My Second Itenary", user_id: @user.id)
		expect(@user.itenaries.count).to be > 1
	end

end
