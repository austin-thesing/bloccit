class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy # => the dependent: :destroy means that when a post is deleted it will delete the comments on the post

  default_scope { order('created_at DESC') }
  
  scope :ordered_by_title, -> { order('title DESC')}
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC')} # might have to use #reload! after you change a model

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
