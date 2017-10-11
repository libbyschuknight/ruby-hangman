class Hangman
  attr_reader :letters, :correct_letters, :output, :incorrect_letters
  attr_accessor :lives

  def initialize
    # game state
    @letters = random_word.chars
    @lives = 8
    @correct_letters = []
    @incorrect_letters = []
    @output = Output.new
  end

  def start
    output.play
    output.display_word(partial_word_guess) # naming
    play_game until game_over?
  end

  private

  def play_game
    # turn and game loop in here - pull out and make separate
    # have turn separate to game loop
    # this method is more like play_turn

    # main control loop
    output.lives_left(lives)
    output.ask_to_pick_letter

    letter = UserInput.new.letter

    if correct_letter?(letter)
      correct_letters << letter
      output.correct_letter
    else
      incorrect_letters << letter
      remove_life
      output.incorrect_letter
    end

    output.display_word(partial_word_guess)
    output.display_incorrect_words(incorrect_letters)

    # TODO: move out of here, don't need both?
    output.win if word_correct?
    output.lose if dead?
  end

  def random_word
    ["dog", "bananas", "cat", "powershop", "word"].sample
  end
  def game_over?
    dead? || word_correct?
  end

  def correct_letter?(letter)
    letters.include?(letter)
  end

  def remove_life
    self.lives -= 1
  end

  def word_correct?
    correct_letters.uniq.sort == letters.uniq.sort
  end

  def dead?
    lives.zero?
  end

  def partial_word_guess
    letters.map do |letter|
      if correct_letters.include?(letter)
        "#{letter} "
      else
        "_ "
      end
    end.join
  end
end
