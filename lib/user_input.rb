require 'io/console'

class UserInput
  def initialize
  end

  def letter
    STDIN.getch.downcase
  end
end
