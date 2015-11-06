include RandomData

# Create Users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all
# Creats a Admin
admin = User.create!(
  name: 'Austin Thesing',
  email: 'austin@designxdevelop.com',
  password: 'Thesing1',
  role: 'admin'
)
# Creates a Member
member = User.create!(
  name: 'Olivia Meers',
  email: 'meers.olivia@gmail.com',
  password: 'meers1'
)
# Creates a Moderator
moderator = User.create!(
  name: 'Moderator',
  email: 'mod@bloccit.com',
  password: 'blocpolice',
  role: 'moderator'
)

# Create Topics
5.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
30.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
25.times do
  Comment.create!(
    post: posts.sample, # => what is this line doing?
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
