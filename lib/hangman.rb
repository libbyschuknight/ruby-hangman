class Hangman
  attr_reader :word_array, :correct_letters_array, :output, :incorrect_letters_array
  attr_accessor :lives

  def initialize(word)
    # game state
    @word_array = word.chars # letters
    @lives = 8
    @correct_letters_array = []
    @incorrect_letters_array = []
    @output = Output.new
  end

  def start
    output.play
    output.display_word(guessed_word) # naming
    play_game until game_over?
  end

  private

  def play_game
    # main control loop
    output.lives_left(lives)
    output.pick_letter # namingf - prompt

    letter = UserInput.new.letter

    if correct_letter?(letter)
      collect_letters(letter, correct_letters_array)
      output.correct_letter
    else
      collect_letters(letter, incorrect_letters_array)
      remove_life
      output.incorrect_letter
    end

    output.display_word(guessed_word)
    output.display_incorrect_words(incorrect_letters_array)

    # TODO: move out of here, don't need both?
    output.win if word_correct?
    output.lose if dead?
  end

  def game_over?
    dead? || word_correct?
  end

  def correct_letter?(letter)
    word_array.include?(letter)
  end

  def collect_letters(letter, collection)
    collection << letter
    # just aliasing a method
  end

  # def correct_letters(letter)
  #   # same as incorrect_letters, pass in collecting array
  #   correct_letters_array << letter
  # end
  #
  # def incorrect_letters(letter)
  #   # same as correct_letters, pass in collecting array
  #   incorrect_letters_array << letter
  # end

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
