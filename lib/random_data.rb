module RandomData
  def random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end
    sentences.join(" ")
  end
  def random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end
    sentence = strings.join(" ")
    sentence.capitalize << "."
  end
  def random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join # => can you explain this line please
  end
  def random_boolean
    rand_boolean = [true, false]
    rand_boolean.sample # => samples an array of boolean values to to return a random T or F value
    # could I achieve the same result doing [true, false].sample ?
  end
end
