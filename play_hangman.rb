$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "hangman"

new_game = Hangman.new("powershop")
new_game.start
