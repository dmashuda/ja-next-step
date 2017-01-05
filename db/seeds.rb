# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

easy_pass = "abc123"

sh_df_1 = Stakeholder.create(name: 'JA of South Central Pennsylvania', keywords: [])
default_admin = sh_df_1.users.create(email: 'mgaydash@gmail.com', password: easy_pass, password_confirmation: easy_pass)
default_admin.user_roles.create(role: UserRole.roles[:stakeholder_admin])
default_admin.user_roles.create(role: UserRole.roles[:admin])
sh_df_1.create_profile(name: 'JA of South Central Pennsylvania', email: 'placeholder@placeholder.org')
