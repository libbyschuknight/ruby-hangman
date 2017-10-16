class GameState
  # TODO: which way would be more ruby-ish
  # have game service methods as is or in here as methods

  attr_reader :letters, :lives, :correct_letters, :incorrect_letters

  def initialize
    @letters = WordGenerator.random_word.chars
    @lives = 10
    @correct_letters = []
    @incorrect_letters = []
  end
end
