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


sh_df.posts.create(subject: 'YCP Engineering Senior Project', abstract: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. ', body: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.\r\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \r\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', contact_email: 'vincemoley@yahoo.com', email_subject: 'Tell me more', email_body: 'Hello Vince, please tell me more about the YCP Engineering program', active: 1, created_at: '2016/07/14 08:06:00', stakeholder_id: 1)