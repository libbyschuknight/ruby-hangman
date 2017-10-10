$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "hangman"
require "user_input"
require "message_output"

new_game = Hangman.new("powershop")
new_game.start
