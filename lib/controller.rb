class Controller
  attr_reader :state, :console_io, :validator, :game_service

  def initialize(state:, game_service:, validator:, console_io:)
    @state = state

    # @correct_letters = state.correct_letters
    # @incorrect_letters = state.incorrect_letters

    # removing
    @game_service = game_service


    @validator = validator
    @console_io = console_io
  end

  def play_game
    console_io.start_game_information(concealed_word, state.lives)
    play_turn until game_service.game_over?(state.lives, state.correct_letters, state.letters)
    game_service.dead?(state.lives) ? console_io.lose : console_io.win
  end

  private

  def play_turn
    # TODO: do this loop in a better why?
    while validate_letter(letter = console_io.user_input); end

    # TODO: refactor
    if state.letters.include?(letter)
      state.correct_letters << letter
      console_io.correct_letter
    else
      state.incorrect_letters << letter
      state.remove_life
      console_io.incorrect_letter
    end

    console_io.turn_information(state.incorrect_letters, concealed_word, state.lives)
    console_io.lives_and_letter(state.lives) unless game_service.game_over?(state.lives, state.correct_letters, state.letters)
  end

  def validate_letter(letter)
    validator.validate(
      letter: letter,
      correct_letters: state.correct_letters,
      incorrect_letters: state.incorrect_letters
    )
  end

  def concealed_word
    state.letters.map { |letter| state.correct_letters.include?(letter) ? letter : nil }
  end
end
