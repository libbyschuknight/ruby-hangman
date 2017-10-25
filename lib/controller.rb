class Controller
  attr_reader :state, :console_io, :validator

  def initialize(state:, validator:, console_io:)
    @state = state
    @validator = validator
    @console_io = console_io
  end

  def play_game
    console_io.start_game_information(state.concealed_word, state.lives)
    play_turn until state.game_over?
    state.lost? ? console_io.lose : console_io.win
  end

  private

  def play_turn
    console_io.lives_and_letter(state.lives)
    guessed_letter = retrieve_user_input
    correct_letter?(guessed_letter) ? correct_guess(guessed_letter) : incorrect_guess(guessed_letter)
    console_io.turn_information(state.incorrect_guessed_letters, state.concealed_word)
  end

  def retrieve_user_input
    loop do
      letter = console_io.user_input
      result = valid_letter_result(letter)
      return letter if result.success?
      console_io.error_message(result.error_type)
    end
  end

  def valid_letter_result(letter)
    validator.validate(letter: letter, game_state: state)
  end

  def correct_letter?(guessed_letter)
    state.letters.include?(guessed_letter)
  end

  def correct_guess(guessed_letter)
    state.correct_guessed_letters << guessed_letter
    console_io.correct_letter
  end

  def incorrect_guess(guessed_letter)
    state.remove_life!
    state.incorrect_guessed_letters << guessed_letter
    console_io.incorrect_letter
  end
end
