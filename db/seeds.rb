include RandomData

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample, # => what is this line doing?
    body: RandomData.random_paragraph
  )
end

25.times do
  Advertisement.create!(
  title: RandomData.random_sentence,
  copy: RandomData.random_paragraph, # => don't forget the , between these lines... It will cause syntax errors
  price: RandomData.random_int
  )
end

puts "Seed finished"
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
puts "#{Advertisement.count} Ads created."
