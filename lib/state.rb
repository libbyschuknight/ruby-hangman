class State
  attr_reader :letters, :correct_guessed_letters, :incorrect_guessed_letters
  attr_accessor :lives

  def initialize(letters:)
    @letters = letters
    @lives = 10
    @correct_guessed_letters = []
    @incorrect_guessed_letters = []
  end

  def remove_life!
    self.lives -= 1
  end

  def lost?
    lives.zero?
  end

  def word_correct?
    (letters - correct_guessed_letters).empty?
  end

  def game_over?
    lost? || word_correct?
  end

  def concealed_word
    letters.map { |letter| correct_guessed_letters.include?(letter) ? letter : nil }
  end
end
