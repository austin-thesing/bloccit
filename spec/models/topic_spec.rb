require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  it { should have_many(:posts) } # needs gem 'shoulda' for it to work

# checks to make sure title,description are present
it {should validate_presence_of(:name)}
it {should validate_presence_of(:description)}


# checks the length of title and body
it {should validate_length_of(:name).is_at_least(5)}
it {should validate_length_of(:description).is_at_least(15)}

  describe "attributes" do
    it "responds to name" do
      expect(topic).to respond_to(:name)
    end
    it "responds to description" do
      expect(topic).to respond_to(:description)
    end
    it "responds to public" do
      expect(topic).to respond_to(:public)
    end
    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
end
