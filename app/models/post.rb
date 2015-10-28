class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :comments, dependent: :destroy # => the dependent: :destroy means that when a post is deleted it will delete the comments on the post

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
end
