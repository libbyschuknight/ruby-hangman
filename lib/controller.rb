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
    state.lost? ? console_io.lose : console_io.win
  end

  private

  def play_turn
    console_io.lives_and_letter(state.lives)
    guessed_letter = retrieve_user_input
    check_letter_in_word(guessed_letter) # bad method name 😫
    console_io.turn_information(state.incorrect_guessed_letters, concealed_word)
  end

  def retrieve_user_input
    loop do
      letter = console_io.user_input
      result = valid_letter_result(letter)
      return letter if result.success?
      console_io.error_message(result.error_type)
    end
  end

  def check_letter_in_word(guessed_letter)
    # doing too much 😫

    # 1 checking if letter in word
    # 2 putting letter in an array
    # 3 printing a message
    # 4 removes a life

    correct_letter?(letter)

    correct_guess(letter)
    incorrect_guess(letter)

    if state.letters.include?(guessed_letter)
      state.correct_guessed_letters << guessed_letter
      console_io.correct_letter
    else
      state.remove_life!
      state.incorrect_guessed_letters << guessed_letter
      console_io.incorrect_letter
    end
  end

  def valid_letter_result(letter)
    validator.validate(
      letter: letter,
      letters: all_letters
    )
  end

  def all_letters
    state.correct_guessed_letters.concat(state.incorrect_guessed_letters)
  end

  def concealed_word
    state.letters.map { |letter| state.correct_guessed_letters.include?(letter) ? letter : nil }
  end
end
