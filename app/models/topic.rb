class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy # deletes posts that fall under a topic when the topic is deleted

  # assignment 35 attempt
  validates :name, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 15}, presence: true
  # REMEMBER!!! --- you need to make sure that your validations are validating the proper things or you will have spec failures
end
