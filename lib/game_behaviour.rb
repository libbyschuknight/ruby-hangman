class GameBehaviour
  def self.remove_life(lives)
    lives - 1
  end

  def self.word_correct?(correct_letters, letters)
    correct_letters.uniq.sort == letters.uniq.sort
  end
end
