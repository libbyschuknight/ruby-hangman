class Hangman
  attr_reader :letters, :correct_letters, :console_io, :incorrect_letters
  attr_accessor :lives

  def initialize
    # game state
    @letters = random_word.chars
    @lives = 8
    @correct_letters = []
    @incorrect_letters = []
    @console_io = ConsoleIo.new
  end

  def start
    console_io.play
    console_io.display_word(partial_word_guess) # naming
    play_game until game_over?
  end

  private

  def play_game
    # turn and game loop in here - pull out and make separate
    # have turn separate to game loop
    # this method is more like play_turn

    # main control loop
    console_io.lives_left(lives)
    console_io.pick_a_letter

    while check_letter(letter = console_io.user_input); end

    if correct_letter?(letter)
      correct_letters << letter
      console_io.correct_letter
    else
      incorrect_letters << letter
      remove_life
      console_io.incorrect_letter
    end

    console_io.display_word(partial_word_guess)
    console_io.display_incorrect_words(incorrect_letters)

    # TODO: move out of here, don't need both?
    console_io.win if word_correct?
    console_io.lose if dead?
  end

  def check_letter(letter)
    if !letter.match(/^[a-zA-Z]+$/) #
      console_io.be_a_letter
      true
    elsif letter.length != 1
      console_io.pick_only_one_letter
      true
    else
      false
    end
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
