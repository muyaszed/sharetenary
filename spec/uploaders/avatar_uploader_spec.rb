require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe AvatarUploader do
include CarrierWave::Test::Matchers

	it "allows only image" do
		uploader = AvatarUploader.new(Profile.new, :avatar)

		expect {

			File.open("#{Rails.root}/spec/fixtures/mypdf.pdf") do |f|

				uploader.store!(f)
			end

		}.to raise_exception(CarrierWave::IntegrityError)


	end

	it "has the correct size" do
		uploader = AvatarUploader.new(Profile.new, :avatar)
		AvatarUploader.enable_processing = true
		File.open("#{Rails.root}/spec/fixtures/avatar.jpeg") do |f|

				uploader.store!(f)
		end

		expect(uploader.avatar).to be_no_larger_than(100, 100)
	end
end