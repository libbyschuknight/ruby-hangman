module GameService
  # TODO: ?? make into class so can have an instance of the class
  # def initialize
  # end

  # rename GameServiceService

  def self.game_over?(lives, correct_letters, letters)
    dead?(lives) || word_correct?(correct_letters, letters)
  end

  def self.word_correct?(correct_letters, letters)
    correct_letters.uniq.sort == letters.uniq.sort
  end

  def self.dead?(lives)
    lives.zero?
  end

  def self.remove_life(lives)
    lives - 1
  end
end
