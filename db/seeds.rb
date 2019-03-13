# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# num_of_users = 7

num_of_topics = 20

num_of_comments = 150

num_of_replies = 600

# all_users = []
all_users = User.all
all_topics = []
all_comments = []

# (1..num_of_users+1).each do
#   user=User.new(username: Faker::Name.name , password: "1234" )
#   user.save
#   all_users << user
# end

(1..num_of_topics+1).each do
  topic=Topic.new(title: Faker::Hipster.sentence(3) , description: Faker::Lorem.sentence )
  topic.save
  all_topics  << topic
end


(1..num_of_comments+1).each do
  comment=Comment.create(entry: Faker::Lorem.paragraph )
  all_comments  << comment
  user = all_users.sample
  user.comments << comment
  user.save

  topic = all_topics.sample
  topic.comments << comment
  topic.save

end

(1..num_of_replies+1).each do

  comment = all_comments.sample
  user = all_users.sample
  topic = comment.topic
  reply = Reply.new(entry: Faker::Lorem.paragraph , user_id: user.id , comment_id: comment.id , topic_id: topic.id)
  reply.save
  user.replies << reply
  user.save
end
