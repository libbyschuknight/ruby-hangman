class LetterHandler
  attr_reader :correct_letters_array

  def initialize(correct_letters_array = [])
    @correct_letters_array = correct_letters_array
  end

  def letter_in_word?(letter:, word:)
    word.include?(letter)
  end
end
