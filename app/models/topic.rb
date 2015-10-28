class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy # deletes posts that fall under a topic when the topic is deleted
end
