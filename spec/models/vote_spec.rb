require 'rails_helper'
include RandomData

RSpec.describe Vote, type: :model do
  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph )}
  let(:user) {Topic.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld")}
  let(:post) {topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)}
  let(:vote) {Vote.create!(value: 1, post: post, user: user)}

  it {should belong_to(:post)}
  it {should belong_to(:user)}

  it {should validate_presence_of(:value)}
  it {should validate_inclusion_of(:value).in_array([-1, 1])}

  describe "voting" do
    before do
      3.times{ post.votes.create!(value: 1)}
      2.times{ post.votes.create!(value: -1)}

      @up_votes = post.votes.where(value: 1).count
      @down_votes = post.votes.where(value: -1).count
    end

    describe "#up_votes" do
      it "counts the number of votes with a value = 1" do
        expect(post.up_votes).to eq(@up_votes)
      end
    end
    describe "#down_votes" do
      it "counts the number of votes with a value = -1" do
        expect(post.down_votes).to eq(@down_votes)
      end
    end
    describe "#points" do
      it "returns the sum of all down and up votes" do
        expect(post.points).to eq(@up_votes - @down_votes)
      end
    end
  end
end
