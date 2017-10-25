require "spec_helper"

RSpec.describe Controller do
  let(:state) { State.new(letters: "flux".chars) }
  let(:validator) { LetterValidator.new }
  let(:console_io) { ConsoleIo.new }

  subject(:game) do
    described_class.new(
      state: state,
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

  describe "playing a game" do
    context "when game is lost" do
      it "returns a lose message" do
        # allow(state).to receive(:lost?).and_return(true)
        state.lives = 0
        expect(console_io).to receive(:lose)
        game.play_game
      end
    end

    context "when game is won" do
      it "returns a win message" do
        # allow(state).to receive(:word_correct?).and_return(true)

        expect(console_io).to receive(:win)
        game.play_game
      end
    end
  end
end
