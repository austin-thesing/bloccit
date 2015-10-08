class Question < ActiveRecord::Base
  has_many: answers # => why is this answers when the actual model is just Answer?
end
