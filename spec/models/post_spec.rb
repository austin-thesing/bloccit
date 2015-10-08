require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:post) { Post.create! title: "New Post Title", body: "New Post Body" } # is this basically a hash with a key and a value with a key of title and a value of New Post Title? 

  describe "attributes" do
    it "responds to title" do
      expect(post).to respond_to(:title)
    end
    it "responds to body" do
      expect(post).to respond_to(:body)
    end
  end
end
