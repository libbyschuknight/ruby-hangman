class GameState
  attr_reader :letters

  def initialize
    @letters = random_word.chars
  end

  def random_word
    ["dog", "bananas", "cat", "powershop", "word"].sample
  end
end
