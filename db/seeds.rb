# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

easy_pass = "abc123"

kw_ruby = Keyword.create(label: 'ruby')
kw_rails = Keyword.create(label: 'rails')
kw_go = Keyword.create(label: 'golang')
kw_java = Keyword.create(label: 'java')


kw_writing = Keyword.create(label: 'writing')
kw_journalism = Keyword.create(label: 'journalism')
kw_autocad = Keyword.create(label: 'autocad')

cf_swe = CareerField.create({active: true, label: 'software engineering', keywords: [kw_go, kw_java, kw_ruby, kw_rails]})
cf_me = CareerField.create({active: false, label: 'mechanical engineering', keywords: [kw_autocad]})


sh_df = Stakeholder.create(name: 'dataforma', keywords: [kw_java])
sh_df.users.create(email: 'dmashuda@ycp.edu', password: easy_pass, password_confirmation: easy_pass)

df_profile = sh_df.build_profile
df_profile.name = 'Dataforma Inc'
df_profile.website_url = 'www.dataforma.com'
df_profile.save


