#!/usr/bin/env ruby

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "hangman"
require "console_io"
require "game_state"
require "game_behaviour"
require "word_generator"
require "letter_validator"

validator = LetterValidator.new(output: ConsoleIo.new)
new_game = Hangman.new(game_state: GameState.new, validator: validator)
new_game.play_game
