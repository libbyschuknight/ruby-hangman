class LetterValidator
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def alpha_character?
    !!letter.match(/^[a-zA-Z]+$/)
  end

  def one_character?
    letter.length == 1
  end

  def already_tried?(correct_letters, incorrect_letters)
    correct_letters.include?(letter) || incorrect_letters.include?(letter)
  end
end
