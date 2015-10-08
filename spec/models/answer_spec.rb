require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!( title: "New Question Title", body: "New Question Body", resolved: false )}
  let(:answer) { Answer.create! ( body: "New Answer Body", question: question)}

  describe "attributes" do
    it "respond to body" do
      expect(answer).to respond_to(:body)
    end
  end
end