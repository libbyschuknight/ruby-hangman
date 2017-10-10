class MessageOutput
  attr_reader :message

  # QUESTION: do I want to always have an initialize method for every class?
  # def initialize
  #   @message = message
  # end

  def print(message)
    puts message
  end
end
