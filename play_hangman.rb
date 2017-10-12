$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "hangman"
require "console_io"

new_game = Hangman.new
new_game.game_loop
