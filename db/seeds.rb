# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 5.times do |num|

# 	User.create(email: "email#{num}@test.com", username:"muyaszed#{num}", password: "123456", password_confirmation: "123456")

# end

# User.all.each do |user|

# 	itenary = Itenary.create(title: "Title #{user.id}", user_id: user.id)
# 	5.times do |num|
# 		Item.create(day: "#{num}", desc: "Description #{num}", itenary_id: itenary.id)
# 	end
# end