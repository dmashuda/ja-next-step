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


swe = CareerField.create({label: 'software engineering'})
swe.keywords.create(label: 'ruby')
swe.keywords.create(label: 'rails')
swe.keywords.create(label: 'golang')
swe.keywords.create(label: 'java')

