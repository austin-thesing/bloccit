class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy # deletes posts that fall under a topic when the topic is deleted
  has_many :sponsored_posts, dependent: :destroy # must be on seperate lines
end
