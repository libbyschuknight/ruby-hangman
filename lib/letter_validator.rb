class LetterValidator
  attr_reader :output

  def initialize; end

  Result = Struct.new(:status, :error_type) do
    def success?
      status == :ok
    end
  end

  def validate(letter:, letters:)
    if valid?(letter, letters)
      Result.new(:ok, nil)
    else
      Result.new(:error, error(letter, letters))
    end
  end

  private

  def valid?(letter, letters)
    alpha_character?(letter) && one_character?(letter) && !already_tried?(letter, letters)
  end

  def alpha_character?(letter)
    !!letter.match(/^[a-zA-Z]+$/)
  end

  def one_character?(letter)
    letter.length == 1
  end

  def already_tried?(letter, letters)
    letters.include?(letter)
  end

  def error(letter, letters)
    if !alpha_character?(letter)
      :alpha
    elsif !one_character?(letter)
      :one
    elsif already_tried?(letter, letters)
      :tried
    end
  end
end
