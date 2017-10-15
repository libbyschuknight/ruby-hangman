class LetterValidator
  attr_reader :output

  def initialize(output:)
    @output = output
  end

  def validate(letter:, correct_letters:, incorrect_letters:)
    if !alpha_character?(letter)
      # result object, success / error - error message
      output.be_a_letter
      true
    elsif !one_character?(letter)
      output.pick_only_one_letter
      true
    elsif already_tried?(letter, correct_letters, incorrect_letters)
      output.have_already_tried
      true
    else
      false
    end
  end

  private

  def alpha_character?(letter)
    !!letter.match(/^[a-zA-Z]+$/)
  end

  def one_character?(letter)
    letter.length == 1
  end

  def already_tried?(letter, correct_letters, incorrect_letters)
    correct_letters.include?(letter) || incorrect_letters.include?(letter)
  end
end
