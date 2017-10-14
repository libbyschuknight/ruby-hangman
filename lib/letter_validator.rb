class LetterValidator
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def alpha_char?
    !!letter.match(/^[a-zA-Z]+$/)
  end
end
