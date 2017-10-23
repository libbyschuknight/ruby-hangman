class State
  attr_reader :letters, :correct_letters, :incorrect_letters
  attr_accessor :lives

  def initialize(letters)
    @letters = letters
    @lives = 10
    @correct_letters = []
    @incorrect_letters = []
  end

  def remove_life
    self.lives -= 1
  end

  def dead?
    lives.zero?
  end

  def word_correct?
    (letters - correct_letters).empty?
  end

  def game_over?
    dead? || word_correct?
  end
end
