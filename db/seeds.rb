include RandomData
# Create posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all
# Create comments
100.times do
  Comment.create!(
    post: posts.sample, # => what is this line doing?
    body: RandomData.random_paragraph
  )
end
#-------Assignment 33 Attempt---------------
# Create single post
Post.find_or_create_by!(
  title: "Solo Post",
  body: "Hello world I am a solo post created in the seeds.rb file."
)
# Create a single comment
Comment.find_or_create_by!(
  post: posts.sample, # why do I not need this line like I do in the comment generation above?
  body: "This is a single comment generated only once"
)

puts "Seed finished"
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."

# => Assignment 33 Attempt
