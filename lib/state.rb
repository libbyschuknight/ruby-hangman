class State
  attr_reader :letters, :correct_letters, :incorrect_letters
  attr_accessor :lives

  def initialize(letters:)
    @letters = letters
    @lives = 10
    @correct_letters = []
    @incorrect_letters = []
  end

  def remove_life!
    # NOTE: why is this not working with just "lives"? works with self
    @lives -= 1
  end

  def lost?
    lives.zero?
  end

  def word_correct?
    (letters - correct_letters).empty?
  end

  def game_over?
    lost? || word_correct?
  end
end
