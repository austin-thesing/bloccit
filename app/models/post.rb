class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy # => the dependent: :destroy means that when a post is deleted it will delete the comments on the post
end
