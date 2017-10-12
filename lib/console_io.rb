class ConsoleIo
  attr_reader :message

  GAME_OVER = ">>>> GAME OVER <<<<".freeze

  def user_input
    gets.chomp
  end

  def print(message)
    puts message
    puts
  end

  def start_game_information(concealed_word)
    print("😃   LETS PLAY HANGMAN!!! 😜")
    display_word(concealed_word)
    pick_a_letter
  end

  def turn_information(incorrect_letters, concealed_word, lives)
    display_incorrect_words(incorrect_letters)
    display_word(concealed_word)
    lives_left(lives)
    pick_a_letter
  end

  def lives_left(lives)
    print("You have #{lives} lives left 😱")
  end

  def pick_a_letter
    print("Pick a letter:")
  end

  def pick_only_one_letter
    print("Only enter one letter, please pick again 😁")
  end

  def be_a_letter
    print("It must be a letter, please pick again 😁")
  end

  def correct_letter
    print("Cool, that letter is there.")
  end

  def incorrect_letter
    print("Nope, that letter is not there.")
  end

  def have_already_guessed
    print("You have already guessed that letter, please pick again 😁")
  end

  def display_word(word)
    print(word)
  end

  def display_incorrect_words(letters)
    print("Incorrect guesses: #{letters.join(', ')}")
  end

  def win
    print("🎊 🎊 🎊   Yay! You got it right! You win! Congrats!   🎉🎉🎉")
    print(GAME_OVER)
  end

  def lose
    print("😟   Oh no! You lose!  😭")
    print(GAME_OVER)
  end
end
