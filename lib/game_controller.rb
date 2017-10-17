class GameController
  attr_reader :letters, :correct_letters, :console_io, :incorrect_letters, :game_state, :validator, :game_service
  attr_accessor :lives

  def initialize(game_state:, game_service:, validator:, console_io:)
    # NOTE: mentor feedback on this vs using game_state.letters thru file
    @letters = game_state.letters
    @lives = game_state.lives
    @correct_letters = game_state.correct_letters
    @incorrect_letters = game_state.incorrect_letters
    @game_service = game_service
    @validator = validator
    @console_io = console_io
  end

  def play_game
    console_io.start_game_information(concealed_word, lives)
    play_turn until game_service.game_over?(lives, correct_letters, letters)
    game_service.dead?(lives) ? console_io.lose : console_io.win
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
      self.lives = game_service.remove_life(lives)
      console_io.incorrect_letter
    end

    console_io.turn_information(incorrect_letters, concealed_word, lives)
    console_io.lives_and_letter(lives) unless game_service.game_over?(lives, correct_letters, letters)
  end

  def validate_letter(letter)
    validator.validate(
      letter: letter,
      correct_letters: correct_letters,
      incorrect_letters: incorrect_letters
    )
  end

  # TODO: do something so that strings are not in here, return letter or nil
  # game service?
  # game state?
  def concealed_word
    letters.map { |letter| correct_letters.include?(letter) ? letter : nil }
  end
end
