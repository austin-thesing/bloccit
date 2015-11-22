class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy # => the dependent: :destroy means that when a post is deleted it will delete the comments on the post
  has_many :votes, dependent: :destroy

  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  default_scope { order('rank DESC') }

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  before_action :create_vote

  def up_votes
    votes.where(value: 1).count #gets all votes with a value of 1 and totals them
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value) #is a sum of the up and down votes together
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end

private
  def create_vote
    user.votes.create(value: 1, post: self)
  end
end
