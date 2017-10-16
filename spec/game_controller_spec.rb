require "spec_helper"

RSpec.describe GameController do
  let(:game_state) do
    instance_double(
      "GameState",
      letters: ["f", "l", "u", "x"],
      lives: 5,
      correct_letters: [],
      incorrect_letters: []
    )
  end

  let(:game) do
    GameController.new(
      game_state: game_state,
      game_service: nil,
      validator: nil,
      console_io: ConsoleIo.new
    )
  end

  describe "initializing a game" do

    # do I want to test that hangman has a GameState object?
    # if yes, then would need to make it a instance variable
    xit "has a game state" do
      expect(game.game_state).to eq(game_state)
    end

    # doubling up testing game state here???
    it "has letters" do
      expect(game.letters).to eq(["f", "l", "u", "x"])
    end

    it "has 10 lives" do
      expect(game.lives).to eq(5)
    end

    it "has correct letters" do
      expect(game.correct_letters).to eq([])
    end

    it "has incorrect letters" do
      expect(game.incorrect_letters).to eq([])
    end

    it "has a console input output object" do
      expect(game.console_io).to be_an_instance_of(ConsoleIo)
    end
  end
end
