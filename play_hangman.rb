#!/usr/bin/env ruby

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require "pry"

require "controller"
require "console_io"
require "state"
require "word_generator"
require "letter_validator"

new_game = Controller.new(
  state: State.new(letters: WordGenerator.random_word.chars),
  validator: LetterValidator.new,
  console_io: ConsoleIo.new,
)
new_game.play_game
