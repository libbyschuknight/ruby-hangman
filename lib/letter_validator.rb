class LetterValidator
  attr_reader :output

  def initialize; end

  Result = Struct.new(:status, :error_type) do
    def success?
      status == :ok
    end
  end

  def validate(letter:, correct_letters:, incorrect_letters:)
    if valid?(letter, correct_letters, incorrect_letters)
      Result.new(:ok, nil)
    else
      Result.new(:error, error(letter, correct_letters, incorrect_letters))
    end
  end

  private

  def valid?(letter, correct_letters, incorrect_letters)
    alpha_character?(letter) && one_character?(letter) && !already_tried?(letter, correct_letters, incorrect_letters)
  end

  def alpha_character?(letter)
    !!letter.match(/^[a-zA-Z]+$/)
  end

  def one_character?(letter)
    letter.length == 1
  end

  def already_tried?(letter, correct_letters, incorrect_letters)
    correct_letters.include?(letter) || incorrect_letters.include?(letter)
  end

  def error(letter, correct_letters, incorrect_letters)
    if !alpha_character?(letter)
      :alpha
    elsif !one_character?(letter)
      :one
    elsif already_tried?(letter, correct_letters, incorrect_letters)
      :tried
    end
  end
end
