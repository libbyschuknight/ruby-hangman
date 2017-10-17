class State
  attr_reader :letters, :correct_letters, :incorrect_letters
  attr_accessor :lives

  def initialize
    @letters = WordGenerator.random_word.chars
    @lives = 10
    @correct_letters = []
    @incorrect_letters = []
  end

  def remove_life
    self.lives -= 1
  end
end
