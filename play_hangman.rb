#!/usr/bin/env ruby

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "hangman"
require "console_io"
require "game_state"
require "game_behaviour"
require "word_generator"
require "letter_validator"

new_game = Hangman.new
new_game.play_game
