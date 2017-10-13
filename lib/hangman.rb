class Hangman
  attr_reader :letters, :correct_letters, :console_io, :incorrect_letters
  attr_accessor :lives

  def initialize
    # game state
    @letters = random_word.chars
    @lives = 8
    @correct_letters = []
    @incorrect_letters = []
    ###
    @console_io = ConsoleIo.new
  end

  def play_game
    console_io.start_game_information(concealed_word)
    play_turn until game_over?
    console_io.win if word_correct?
    console_io.lose if dead?
  end

  private

  def play_turn
    while check_letter(letter = console_io.user_input); end

    if letters.include?(letter)
      correct_letters << letter
      console_io.correct_letter
    else
      incorrect_letters << letter
      remove_life
      console_io.incorrect_letter
    end

    console_io.turn_information(incorrect_letters, concealed_word, lives)
  end

  def check_letter(letter)
    if !letter.match(/^[a-zA-Z]+$/)
      # result object, success / error - error message
      console_io.be_a_letter
      true
    elsif letter.length != 1
      console_io.pick_only_one_letter
      true
    elsif already_guessed?(letter)
      console_io.have_already_guessed
      true
    else
      false
    end
  end

  def already_guessed?(letter)
    correct_letters.include?(letter) || incorrect_letters.include?(letter)
  end


  # game behaviour

  def random_word
    ["dog", "bananas", "cat", "powershop", "word"].sample
  end

  def game_over?
    dead? || word_correct?
  end

  def dead?
    lives.zero?
  end

  def word_correct?
    correct_letters.uniq.sort == letters.uniq.sort
  end

  def remove_life
    self.lives -= 1
  end

  ####

  def concealed_word
    letters.map do |letter|
      if correct_letters.include?(letter)
        "#{letter} "
      else
        "_ "
      end
    end.join
  end
end
