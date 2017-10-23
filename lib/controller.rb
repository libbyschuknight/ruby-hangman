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
    # TODO: do this loop in a better why?
    # while true keeping getting input
    # but want to have while not valid keep getting user input
    # is letter valid - valid_letter?

    # until letter is valid (true) keep asking for a letter
    until valid_letter?(letter = console_io.user_input); end

    # until validate_letter(letter = console_io.user_input); end

    # NOTE: not sure about moving into methods and names of methods
    if state.letters.include?(letter)
      collect_and_display_letter(letter)
    else
      collect_letter_take_live_display_letter(letter)
    end

    # NOTE: ternary???
    # state.letters.include?(letter) ? collect_and_display_letter(letter) : collect_letter_take_live_display_letter(letter)

    turn_information
  end

  def valid_letter?(letter)
    validator.validate(
      letter: letter,
      correct_letters: state.correct_letters,
      incorrect_letters: state.incorrect_letters
    )

    # result object, return succes or not / true or false
    # print message here - result obejct message

    # return result - true or false

    # if valid letter
    #   return true
    # if not valid
    #   retrun false

  end

  # def validate_letter(letter)
  #   validator.validate(
  #     letter: letter,
  #     correct_letters: state.correct_letters,
  #     incorrect_letters: state.incorrect_letters
  #   )
  # end

  def concealed_word
    state.letters.map { |letter| state.correct_letters.include?(letter) ? letter : nil }
  end

  def collect_and_display_letter(letter)
    state.correct_letters << letter
    console_io.correct_letter
  end

  def collect_letter_take_live_display_letter(letter)
    state.incorrect_letters << letter
    state.remove_life
    console_io.incorrect_letter
  end

  def turn_information
    console_io.turn_information(state.incorrect_letters, concealed_word)
    console_io.lives_and_letter(state.lives) unless state.game_over?
  end
end
