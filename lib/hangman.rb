class Hangman
  # Game controller
  attr_reader :letters, :correct_letters, :console_io, :incorrect_letters, :game_state
  attr_accessor :lives

  def initialize(game_state = GameState.new)
    @letters = game_state.letters
    @lives = game_state.lives
    @correct_letters = game_state.correct_letters
    @incorrect_letters = game_state.incorrect_letters

    @console_io = ConsoleIo.new
  end

  def play_game
    console_io.start_game_information(concealed_word)
    play_turn until GameBehaviour.game_over?(lives, correct_letters, letters)
    console_io.win if GameBehaviour.word_correct?(correct_letters, letters)
    console_io.lose if GameBehaviour.dead?(lives)
  end

  private

  def play_turn
    while check_letter(letter = console_io.user_input); end

    if letters.include?(letter)
      correct_letters << letter
      console_io.correct_letter
    else
      incorrect_letters << letter
      self.lives = GameBehaviour.remove_life(lives)
      console_io.incorrect_letter
    end

    console_io.turn_information(incorrect_letters, concealed_word, lives)
  end

  # validation
  def check_letter(letter)
    validator = LetterValidator.new(letter)
    if !validator.alpha_char?
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
