module GameService
  # TODO: ?? make into class so can have an instance of the class?? why though?
  # def initialize
  # end

  # TODO: differnce between moudel  and class

  def self.game_over?(lives, correct_letters, letters)
    dead?(lives) || word_correct?(correct_letters, letters)
  end

  def self.word_correct?(correct_letters, letters)
    # TODO: don't ned uniq??
    # letters - correct_letters.empty?
    correct_letters.uniq.sort == letters.uniq.sort
  end

  def self.dead?(lives)
    lives.zero?
  end

  def self.remove_life(lives)
    lives - 1
  end
end
