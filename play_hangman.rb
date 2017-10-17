#!/usr/bin/env ruby

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "game_controller"
require "console_io"
require "game_state"
require "game_service"
require "word_generator"
require "letter_validator"

console_io = ConsoleIo.new

new_game = GameController.new(
  game_state: GameState.new,
  game_service: GameService,
  validator: LetterValidator.new(output: console_io),
  console_io: console_io,
)
new_game.play_game
