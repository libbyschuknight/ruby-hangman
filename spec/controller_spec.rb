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

  let(:game_service) do
    class_double("GameService", dead?: true)
  end

  let(:game) do
    Controller.new(
      state: state,
      game_service: game_service,
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

  xdescribe "playing a game" do
    context "when game is lost" do
      it "returns something??" do
        allow(console_io).to receive(:start_game_information)
        allow(game_service).to receive(:game_over?).and_return(true)
        allow(console_io).to receive(:lose)
        result = game.play_game
        expect(result).to eq("")
        # expect stdin to eq "lose"
      end
    end
  end
end
