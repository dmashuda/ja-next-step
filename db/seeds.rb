# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

easy_email = "abc123"

user = User.new
user.email = "dmashuda@ycp.edu"
user.password = easy_email
user.password_confirmation = easy_email
user.save!
