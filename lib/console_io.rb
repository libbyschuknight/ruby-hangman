class ConsoleIo
  attr_reader :message

  GAME_OVER = ">>>> GAME OVER <<<<".freeze

  def user_input
    gets.chomp.downcase
  end

  def start_game_information(concealed_word, lives)
    print("😃   LETS PLAY HANGMAN!!! 😜")
    print("The word is: ")
    display_concealed_word(concealed_word)
  end

  def turn_information(incorrect_guessed_letters, concealed_word)
    print("____________________________")
    display_incorrect_words(incorrect_guessed_letters)
    display_concealed_word(concealed_word)
  end

  def error_message(type)
    return if type.nil?
    if type == :alpha
      be_a_letter
    elsif type == :one
      pick_only_one_letter
    elsif type == :tried
      already_tried_letter
    end
  end

  def lives_and_letter(lives)
    lives_left(lives)
    pick_a_letter
  end

  def correct_letter
    print("Cool, that letter is there.")
  end

  def incorrect_letter
    print("Nope, that letter is not there.")
  end

  def win
    print("🎊 🎊 🎊   Yay! You got it right! You win! Congrats!   🎉🎉🎉")
    print(GAME_OVER)
  end

  def lose
    print("😟   Oh no! You lose!  😭")
    print(GAME_OVER)
  end

  private

  def print(message)
    puts message
    puts
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

  def already_tried_letter
    print("You have already guessed that letter, please pick again 😁")
  end

  def display_concealed_word(word)
    word.map! { |element| element.nil? ? "_" : element }
    print(word.join(" "))
  end

  def display_incorrect_words(letters)
    print("Incorrect guesses: #{letters.join(', ')}")
  end
end
