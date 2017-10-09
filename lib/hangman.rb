class Hangman
  attr_reader :word, :correct_letters
  attr_accessor :lives

  def initialize(word)
    @word = word.chars
    @lives = 8
    @correct_letters = []
  end

  def start
    print_message("😃   LETS PLAY HANGMAN!!! 😜")
    print_message(empty_word) # at the moment this will always be _ 's
    play_game until game_over?
  end

  def play_game
    print_message("You have #{lives} lives left 😱")
    print_message("Pick a letter: ")
    letter = UserInput.new.letter
    letter_correct?(letter)
    print_message("\n 🎊 🎊 🎊   Yay! You got it right! You win! Congrats!   🎉🎉🎉 \n >>>> GAME OVER <<<<") if word_correct?
    print_message("\n 😟   Oh no! You lose!  😭 \n >>>> GAME OVER <<<<") if dead?
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
    print_message(display_word.join)
  end

  def collect_letters_print_message(letter)
    # don't feel great about moving this out into method, just moving code around
    correct_letters << letter
    print_message("Cool, that letter is there!")
    true
  end

  def remove_life_print_message
    self.lives -= 1
    print_message("That letter is not in the word.")
    false
  end

  def word_correct?
    correct_letters.uniq.sort == word.uniq.sort
  end

  def dead?
    lives.zero?
  end

  def print_message(message)
    puts message
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
