require "spec_helper"

RSpec.describe Controller do
  let(:state) do
    instance_double(
      "State",
      letters: ["f", "l", "u", "x"],
      lives: 5,
      correct_letters: [],
      incorrect_letters: []
    )
  end

  let(:validator) { instance_double("LetterValidator") }

  let(:console_io) { instance_double("ConsoleIo") }

  let(:game) do
    Controller.new(
      state: state,
      game_service: nil,
      validator: validator,
      console_io: console_io
    )
  end

  describe "initializing a game" do
    it "has a game state" do
      expect(game.state).to eq(state)
    end

    it "has a letter validator object" do
      expect(game.validator).to eq(validator)
    end

    it "has a console io object" do
      expect(game.console_io).to eq(console_io)
    end
  end
end
