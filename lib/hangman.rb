class Hangman
  attr_reader :word_array, :correct_letters_array, :output, :incorrect_letters_array
  attr_accessor :lives

  def initialize(word)
    @word_array = word.chars
    @lives = 8
    @correct_letters_array = []
    @incorrect_letters_array = []
    @output = Output.new
  end

  def start
    output.play
    output.display_word(guessed_word)
    play_game until game_over?
  end

  def play_game
    output.lives_left(lives)
    output.pick_letter

    letter = UserInput.new.letter

    if correct_letter?(letter)
      correct_letters(letter)
      output.correct_letter
    else
      incorrect_letters(letter)
      remove_life
      output.incorrect_letter
    end

    output.display_word(guessed_word)
    output.display_incorrect_words(incorrect_letters_array)

    output.win if word_correct?
    output.lose if dead?
  end

  def game_over?
    dead? || word_correct?
  end

  def correct_letter?(letter)
    letter_handler = LetterHandler.new
    letter_handler.letter_in_word?(letter, word_array)
  end

  def correct_letters(letter)
    correct_letters_array << letter
  end

  def incorrect_letters(letter)
    incorrect_letters_array << letter
  end

  def remove_life
    self.lives -= 1
  end

  def word_correct?
    correct_letters_array.uniq.sort == word_array.uniq.sort
  end

  def dead?
    lives.zero?
  end

  def guessed_word
    word_array.map do |letter|
      if correct_letters_array.include?(letter)
        "#{letter} "
      else
        "_ "
      end
    end.join
  end
end
