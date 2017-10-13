class GameState
  attr_reader :letters, :lives

  def initialize
    @letters = WordGenerator.random_word.chars
    @lives = 10
  end
end
