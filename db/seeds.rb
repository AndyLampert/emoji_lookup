# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.username = 'IAmTheSeedMan'
user.email = 'seedman@example.com'
user.encrypted_password = '#$taawktljasktlw4aaglj'
user.password = 'arstarst'
user.password_confirmation = 'arstarst'
user.save!

post = Post.new
post.entry = 'The Great Seeding'
post.user_id = 1
post.save!

comment1 = Comment.new
comment1.post_id = 1
comment1.user_id = 1
comment1.body = 'Fear the seeded man! All shall peril and wilt!'
comment1.save!
