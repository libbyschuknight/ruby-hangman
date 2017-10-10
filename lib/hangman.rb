class Hangman
  attr_reader :word, :correct_letters_array, :message
  attr_accessor :lives

  GAME_OVER = "\n >>>> GAME OVER <<<<".freeze

  def initialize(word)
    @word = word.chars
    @lives = 8
    @correct_letters_array = []
    @message = MessageOutput.new
  end

  def start
    message.print("😃   LETS PLAY HANGMAN!!! 😜")
    # message.lets_play - TODO
    message.print(empty_word) # at the moment this will always be _ 's
    play_game until game_over?
  end

  def play_game
    message.print("You have #{lives} lives left 😱")
    message.print("Pick a letter: ")

    # QUESTION: is it okay doing this
    # letter = UserInput.new.letter
    # or would it be better to do
    # user_input = UserInput.new
    # letter = user_input.letter
    # or should I do something different in the class?


    user_input = UserInput.new
    letter = user_input.letter
    # correct_letter?(letter)

    letter_handler = LetterHandler.new

    # is it the correct letter?
    if letter_handler.letter_in_word?(letter: letter, word: word)
      correct_letters_array << letter
      # p correct_letters_array
      message.print("Cool, that letter is there!")
      # call method in output class that prints this message
      # move all strings to output class
    else
      remove_life_and_print_message
    end
    message.print(display_guessed_word.join)


    # if correct letter
    #   collect in array
    #   print out message - "letter is correct"

    # if not correct letter
    #   remove a life
    #   print out message - "letter is not correct"

    # display guessed word



    # def correct_letter?(letter)
    #   if word.include?(letter)
    #     collect_letters_and_print_message(letter)
    #   else
    #     remove_life_and_print_message
    #   end
    #   message.print(display_guessed_word.join)
    # end

    message.print("\n 🎊 🎊 🎊   Yay! You got it right! You win! Congrats!   🎉🎉🎉  #{GAME_OVER}") if word_correct?
    message.print("\n 😟   Oh no! You lose!  😭  #{GAME_OVER}") if dead?
  end

  def game_over?
    dead? || word_correct?
  end

  def collect_letters_and_print_message(letter)
    # don't feel great about moving this out into method, just moving code around
    correct_letters_array << letter
    message.print("Cool, that letter is there!")
    # call method in output class that prints this message
    # move all strings to output class
    true
  end

  def remove_life_and_print_message
    # QUESTION: why self instead of @?
    self.lives -= 1
    message.print("That letter is not in the word.")
    false
  end

  def word_correct?
    correct_letters_array.uniq.sort == word.uniq.sort
  end

  def dead?
    lives.zero?
  end

  def empty_word
    empty_chars = word.map { "_ " }.join
    "The word: #{empty_chars}"
  end

  def display_guessed_word
    word.map do |letter|
      if correct_letters_array.include?(letter)
        "#{letter} "
      else
        "_ "
      end
    end
  end
end
