class Output
  attr_reader :message

  GAME_OVER = ">>>> GAME OVER <<<<".freeze

  # QUESTION: do I want to always have an initialize method for every class?
  # def initialize
  #   @message = message
  # end

  def print(message)
    puts message
    puts
  end

  def play
    print("😃   LETS PLAY HANGMAN!!! 😜")
  end

  def lives_left(lives)
    print("You have #{lives} lives left 😱.")
  end

  def pick_a_letter
    print("Pick a letter:")
  end

  def pick_only_one_letter
    print("Only enter one letter, please pick again 😁.")
  end

  def correct_letter
    print("Cool, that letter is there.")
  end

  def incorrect_letter
    print("Nope, that letter is not there.")
  end

  def display_word(word)
    print(word)
  end

  def display_incorrect_words(array)
    letters = array.reject(&:empty?).uniq.join(", ")
    print("Incorrect letters: #{letters}")
  end

  def win
    print("🎊 🎊 🎊   Yay! You got it right! You win! Congrats!   🎉🎉🎉.")
    print(GAME_OVER)
  end

  def lose
    print("😟   Oh no! You lose!  😭.")
    print(GAME_OVER)
  end
end
