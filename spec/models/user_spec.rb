require 'rails_helper'

describe 'User creation' do

	before do
		@user = FactoryGirl.create(:user_with_itenaries)
	end
	

	it "can be created" do
		
		expect(@user).to be_valid
	end

	it "can't be created without username" do
		@user.username = nil 
		expect(@user).to_not be_valid
	end 

	it "can't be created without email" do
		@user.email = nil
		expect(@user).to_not be_valid
	end 

	it "has many itenaries" do
		expect(@user.itenaries.count).to be > 1
	end

end
