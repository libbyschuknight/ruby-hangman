class UserInput
  attr_reader :letter

  def initialize(letter = gets.chomp.downcase)
    @letter = letter
  end

  # TODO: anther method
end
