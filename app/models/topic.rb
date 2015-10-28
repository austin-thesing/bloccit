class Topic < ActiveRecord::Base
  has_many :posts, :sponsoredposts, dependent: :destroy # deletes posts that fall under a topic when the topic is deleted
end
