$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "hangman"
require "user_input"
require "message_output"
require "letter_handler"


new_game = Hangman.new("powershop")
new_game.start
