#!/usr/bin/env ruby

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "controller"
require "console_io"
require "state"
require "word_generator"
require "letter_validator"

console_io = ConsoleIo.new

new_game = Controller.new(
  state: State.new,
  validator: LetterValidator.new(output: console_io),
  console_io: console_io,
)
new_game.play_game
