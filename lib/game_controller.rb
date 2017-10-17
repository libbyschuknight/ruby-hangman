class GameController
  attr_reader :letters, :correct_letters, :console_io, :incorrect_letters, :game_state, :validator, :game_service

  def initialize(game_state:, game_service:, validator:, console_io:)
    @game_state = game_state

    @letters = game_state.letters
    @correct_letters = game_state.correct_letters
    @incorrect_letters = game_state.incorrect_letters

    # removing
    @game_service = game_service


    @validator = validator
    @console_io = console_io
  end

  def play_game
    console_io.start_game_information(concealed_word, game_state.lives)
    play_turn until game_service.game_over?(game_state.lives, correct_letters, letters)
    game_service.dead?(game_state.lives) ? console_io.lose : console_io.win
  end

  private

  def play_turn
    # TODO: do this loop in a better why?
    while validate_letter(letter = console_io.user_input); end

    # TODO: refactor
    if letters.include?(letter)
      correct_letters << letter
      console_io.correct_letter
    else
      incorrect_letters << letter
      game_state.remove_life
      console_io.incorrect_letter
    end

    console_io.turn_information(incorrect_letters, concealed_word, game_state.lives)
    console_io.lives_and_letter(game_state.lives) unless game_service.game_over?(game_state.lives, correct_letters, letters)
  end

  def validate_letter(letter)
    validator.validate(
      letter: letter,
      correct_letters: correct_letters,
      incorrect_letters: incorrect_letters
    )
  end

  def concealed_word
    letters.map { |letter| correct_letters.include?(letter) ? letter : nil }
  end
end
