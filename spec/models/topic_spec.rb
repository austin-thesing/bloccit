require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let (:topic) { Topic.create! (name: RandomData.random_sentence, description: RandomData.random_paragraph)}

  describe "" do
    
  end
end
