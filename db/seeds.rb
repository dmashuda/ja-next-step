# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

easy_pass = "abc123"

human_services_kwd = [
    Keyword.create(label: 'Law'),
    Keyword.create(label: 'Public Safety'),
    Keyword.create(label: 'Criminology'),
    Keyword.create(label: 'Government and Public Administration'),
    Keyword.create(label: 'National security'),
    Keyword.create(label: 'Public management'),
    Keyword.create(label: 'Revenue and Taxation'),
    Keyword.create(label: 'Social workers'),
    Keyword.create(label: 'Child protection'),
    Keyword.create(label: 'Disabilities'),
    Keyword.create(label: 'Interpreter and Translator'),
    Keyword.create(label: 'Education'),
    Keyword.create(label: 'Public Relations')
]
CareerField.create({active: true, label: 'Human Services', keywords: human_services_kwd})

health_science_keywords = [
    Keyword.create(label: 'Biotechnology'),
    Keyword.create(label: 'Pharmacy'),
    Keyword.create(label: 'Medicine'),
    Keyword.create(label: 'Therapeutic Services'),
    Keyword.create(label: 'Nutritionist'),
    Keyword.create(label: 'Research Scientist'),
    Keyword.create(label: 'Animal Health Science'),

]
CareerField.create({active: true, label: 'Health Science', keywords: health_science_keywords})

eng_keywords = [
    Keyword.create(label: 'Architecture and construction'),
    Keyword.create(label: 'Biomedical engineering'),
    Keyword.create(label: 'Software engineering'),
    Keyword.create(label: 'Civil Engineering'),
    Keyword.create(label: 'Mechanical Engineering'),
    Keyword.create(label: 'Aerospace Engineering'),
    Keyword.create(label: 'Electrical Engineering'),
    Keyword.create(label: 'Industrial Engineering'),
    Keyword.create(label: 'Environmental Engineering'),
]
CareerField.create({active: true, label: 'Engineering', keywords: eng_keywords})

tech_kwd = [
    Keyword.create(label: 'Computer Science'),
    Keyword.create(label: 'Information Technology'),
    Keyword.create(label: 'Programming'),
    Keyword.create(label: 'Web Development'),
    Keyword.create(label: 'Computer Hardware Engineer'),
    Keyword.create(label: 'Statistician')
]
CareerField.create({active: true, label: 'Technology', keywords: tech_kwd})

math_kwd = [
    Keyword.where(label: 'Statistician').first,
    Keyword.create(label: 'Finance'),
    Keyword.create(label: 'Accountant')
]
CareerField.create({active: true, label: 'Math', keywords: math_kwd})

manf_kwd = [
    Keyword.create(label: 'Quality Assurance'),
    Keyword.create(label: 'Production'),
    Keyword.create(label: 'Maintenance'),
    Keyword.create(label: 'Supply Chain'),
    Keyword.create(label: 'Environmental Assurance'),
    Keyword.create(label: 'Health and Safety'),
]
CareerField.create({active: true, label: 'Manufacturing', keywords: manf_kwd})

logistics_kwd = [
    Keyword.where(label: 'Health and Safety').first,
    Keyword.create(label: 'Environmental Management'),
    Keyword.create(label: 'Sales'),
    Keyword.create(label: 'Logistics planning'),
    Keyword.create(label: 'Warehousing and Distribution Centers'),
    Keyword.where(label: 'Supply Chain').first
]
CareerField.create({active: true, label: 'Transportation, Distribution and Logistics', keywords: logistics_kwd})

arts_kwd = [
    Keyword.create(label: 'Graphic Design'),
    Keyword.create(label: 'Performing arts'),
    Keyword.create(label: 'Journalism and broadcasting')
]
CareerField.create({active: true, label: 'Arts and Design', keywords: arts_kwd})

agr_kwd = [
    Keyword.create(label: 'Environmental Engineer')
]
CareerField.create({active: true, label: 'Agriculture', keywords: agr_kwd})

food_kwd = [
    Keyword.create(label: 'Nutrition')
]
CareerField.create({active: true, label: 'Food Science', keywords: food_kwd})

bus_man_kwd = [
    Keyword.where(label: 'Finance').first,
    Keyword.create(label: 'Marketing')
]
CareerField.create({active: true, label: 'Business Management', keywords: bus_man_kwd})

education_kwd = [
    Keyword.create(label: 'Scholarships'),
    Keyword.where(label: 'Education').first
]
CareerField.create({active: true, label: 'Furthering Education', keywords: education_kwd})

science_kwd = [
    Keyword.create(label: 'Chemistry'),
    Keyword.create(label: 'Physics'),
    Keyword.create(label: 'Engineering'),
    Keyword.create(label: 'Food Science'),
    Keyword.create(label: 'Marine Biology')
]
CareerField.create({active: true, label: 'Science', keywords: science_kwd})

trades_kwd = [
    Keyword.create(label: 'Electrician'),
    Keyword.create(label: 'Welder'),
    Keyword.create(label: 'General Contractor'),
    Keyword.create(label: 'Mechanic'),
    Keyword.create(label: 'Medical Equipment')
]
CareerField.create({active: true, label: 'Trades', keywords: trades_kwd})

architecture_kwd = []
CareerField.create({active: true, label: 'Architecture and Construction', keywords: architecture_kwd})


sh_df = Stakeholder.create(name: 'dataforma', keywords: [])
sh_df.users.create(email: 'dmashuda@ycp.edu', password: easy_pass, password_confirmation: easy_pass)

df_profile = sh_df.build_profile
df_profile.name = 'Dataforma Inc'
df_profile.website_url = 'www.dataforma.com'
df_profile.save


sh_df.posts.create(subject: 'YCP Engineering Senior Project', abstract: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. ', body: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.\r\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \r\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', contact_email: 'vincemoley@yahoo.com', email_subject: 'Tell me more', email_body: 'Hello Vince, please tell me more about the YCP Engineering program', active: 1, created_at: '2016/07/14 08:06:00', stakeholder_id: 1)