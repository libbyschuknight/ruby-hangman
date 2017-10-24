class Controller
  attr_reader :state, :console_io, :validator

  def initialize(state:, validator:, console_io:)
    @state = state
    @validator = validator
    @console_io = console_io
  end

  def play_game
    console_io.start_game_information(concealed_word, state.lives)
    play_turn until state.game_over?
    state.dead? ? console_io.lose : console_io.win
  end

  private

  def play_turn
    console_io.lives_and_letter(state.lives)
    letter = retrieve_user_input


    # move into method
    # NOTE: not sure about moving into methods and names of methods
    if state.letters.include?(letter)
      # collect_and_display_letter(letter)
      state.correct_letters << letter
      console_io.correct_letter
    else
      # collect_letter_take_live_display_letter(letter)
      state.incorrect_letters << letter
      state.remove_life!
      console_io.incorrect_letter
    end

    console_io.turn_information(state.incorrect_letters, concealed_word)
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
    validator.validate(
      letter: letter,
      # combine arrays
      correct_letters: state.correct_letters,
      incorrect_letters: state.incorrect_letters
    )
  end

  def concealed_word
    state.letters.map { |letter| state.correct_letters.include?(letter) ? letter : nil }
  end

  # def collect_and_display_letter(letter)
  #   state.correct_letters << letter
  #   console_io.correct_letter
  # end
  #
  # def collect_letter_take_live_display_letter(letter)
  #   state.incorrect_letters << letter
  #   state.remove_life
  #   console_io.incorrect_letter
  # end
end
