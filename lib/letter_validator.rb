class LetterValidator
  attr_reader :output

  def initialize(output:)
    @output = output
  end

  # TODO: refactor, result object?

  # 2 concerns, validtin letter and telling outpu class a message
  # return a symbol
  # add to consple oi display right error message,

  def validate(letter:, correct_letters:, incorrect_letters:)

    # a valid letter is:
    # an alpha char?
    # alpha_character?(letter) => true
    # yes
    #
    # one char?
    # one_character?(letter) => true
    # yes
    #
    # has not been already tried?
    # !already_tried?(letter, correct_letters, incorrect_letters) => true
    # no


    # valid or not

    result = alpha_character?(letter) && one_character?(letter) && !already_tried?(letter, correct_letters, incorrect_letters)


    if !alpha_character?(letter)
      output.be_a_letter
    elsif !one_character?(letter)
      output.pick_only_one_letter
    elsif already_tried?(letter, correct_letters, incorrect_letters)
      output.already_tried_letter
    end


    result

    # validation error
    # error or no error

    # if !alpha_character?(letter)
    #   # result object, success / error - error message
    #   output.be_a_letter
    #   false
    #   # return symbol here
    # elsif !one_character?(letter)
    #   output.pick_only_one_letter
    #   false
    # elsif already_tried?(letter, correct_letters, incorrect_letters)
    #   output.already_tried_letter
    #   false
    # else
    #   true
    # end
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
