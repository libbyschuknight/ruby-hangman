class GameController
  # Game controller
  attr_reader :letters, :correct_letters, :console_io, :incorrect_letters, :game_state, :validator, :game_service
  attr_accessor :lives

  def initialize(game_state:, game_service:, validator:, console_io:)
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
    console_io.win if game_service.word_correct?(correct_letters, letters)
    console_io.lose if game_service.dead?(lives)
  end

  private

  def play_turn
    while validate_letter(letter = console_io.user_input); end

    if letters.include?(letter)
      correct_letters << letter
      console_io.correct_letter
    else
      incorrect_letters << letter
      self.lives = game_service.remove_life(lives)
      console_io.incorrect_letter
    end

    console_io.turn_information(incorrect_letters, concealed_word, lives)
  end

  def validate_letter(letter)
    validator.validate(
      letter: letter,
      correct_letters: correct_letters,
      incorrect_letters: incorrect_letters
    )
  end


  # TODO: do something so that strings are not in here, return letter or nil
  # game behaviour?
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
