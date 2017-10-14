require "pry"

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")


require_relative "../lib/hangman"
require_relative "../lib/console_io"
require_relative "../lib/game_state"
require_relative "../lib/game_behaviour"
require_relative "../lib/word_generator"
require_relative "../lib/letter_validator"
