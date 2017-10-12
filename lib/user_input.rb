require 'io/console'

class UserInput
  def initialize
  end

  def letter
    letter = gets.chomp
    return letter if letter.length == 1
    Output.new.pick_only_one_letter
    gets.chomp
  end
end
