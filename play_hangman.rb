$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "hangman"
require "user_input"
require "console_io"

new_game = Hangman.new
new_game.start
