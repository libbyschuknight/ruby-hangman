class Hangman
  attr_reader :word, :correct_letters, :message
  attr_accessor :lives

  def initialize(word)
    @word = word.chars
    @lives = 8
    @correct_letters = []
    @message = MessageOutput.new
  end

  def start
    message.print("😃   LETS PLAY HANGMAN!!! 😜")
    message.print(empty_word) # at the moment this will always be _ 's
    play_game until game_over?
  end

  def play_game
    message.print("You have #{lives} lives left 😱")
    message.print("Pick a letter: ")
    letter = UserInput.new.letter
    # QUESTION: is it okay doing this or would it be better to do
    # user_input = UserInput.new
    # letter = user_input.letter
    # or should I do something different in the class?

    letter_correct?(letter)
    message.print("\n 🎊 🎊 🎊   Yay! You got it right! You win! Congrats!   🎉🎉🎉 \n >>>> GAME OVER <<<<") if word_correct?
    message.print("\n 😟   Oh no! You lose!  😭 \n >>>> GAME OVER <<<<") if dead?
  end

  def game_over?
    dead? || word_correct?
  end

  def letter_correct?(letter)
    if word.include?(letter)
      collect_letters_print_message(letter)
    else
      remove_life_print_message
    end
    message.print(display_word.join)
  end

  def collect_letters_print_message(letter)
    # don't feel great about moving this out into method, just moving code around
    correct_letters << letter
    message.print("Cool, that letter is there!")
    true
  end

  def remove_life_print_message
    # QUESTION: why self instead of @?
    self.lives -= 1
    message.print("That letter is not in the word.")
    false
  end

  def word_correct?
    correct_letters.uniq.sort == word.uniq.sort
  end

  def dead?
    lives.zero?
  end

  def empty_word
    empty_chars = word.map { "_ " }.join
    "The word: #{empty_chars}"
  end

  def display_word
    word.map do |letter|
      if correct_letters.include?(letter)
        "#{letter} "
      else
        "_ "
      end
    end
  end
end
