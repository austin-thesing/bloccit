require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }

  it { should have_many(:comments)}
  it { should have_many(:votes)}

  it { should have_many(:labelings) }
  it { should have_many(:labels).through(:labelings) }

  it { should belong_to(:topic) }
  it { should belong_to(:user) }

  # checks to make sure that title,body,topic all are present
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:topic)}
  it {should validate_presence_of(:user)}

  # checks the length of title and body
  it {should validate_length_of(:title).is_at_least(5)}
  it {should validate_length_of(:body).is_at_least(20)}

  describe "attributes" do
    it "responds to title" do
      expect(post).to respond_to(:title)
    end

    it "responds to body" do
      expect(post).to respond_to(:body)
    end
  end
  
  describe "update_rank" do
    it "calculates the correct rank" do
      post.update_rank
      expect(post.rank).to eq (post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
    end

    it "updates the rank when an up vote is created" do
      old_rank = post.rank
      post.votes.create!(value: 1)
      expect(post.rank).to eq (old_rank + 1)
    end

    it "updates the rank when a down vote is created" do
      old_rank = post.rank
      post.votes.create!(value: -1)
      expect(post.rank).to eq (old_rank - 1)
    end

  end
end
