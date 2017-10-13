class GameState
  attr_reader :letters, :lives

  def initialize
    @letters = random_word.chars
    @lives = 10
  end

  def random_word
    ["dog", "bananas", "cat", "powershop", "word"].sample
  end
end
