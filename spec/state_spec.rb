require "spec_helper"

RSpec.describe State do
  describe "initializing a game state" do
    let(:state) { State.new }

    it "has letters" do
      allow(WordGenerator).to receive(:random_word).and_return("flux")
      expect(state.letters).to eq(["f", "l", "u", "x"])
    end

    it "has ten lives" do
      expect(state.lives).to eq(10)
    end

    it "has correct letters" do
      expect(state.correct_letters).to eq([])
    end

    it "has incorrect letters" do
      expect(state.incorrect_letters).to eq([])
    end
  end

  describe "check the state of a game " do
    let(:state) { State.new }

    it "player is dead" do
      state.lives = 0
      expect(state.dead?).to eq(true)
    end

    it "descreases number of lives" do
      expect { state.remove_life }.to change { state.lives }.by(-1)
    end

    context "when checking the word" do
      it "is correct" do
        allow(WordGenerator).to receive(:random_word).and_return("flux")
        allow(state).to receive(:correct_letters).and_return("flux".chars) # not sure about this??
        result = state.word_correct?
        expect(result).to eq(true)
      end

      it "is not correct" do
        allow(WordGenerator).to receive(:random_word).and_return("flux")
        allow(state).to receive(:correct_letters).and_return(["f"]) # not sure
        result = state.word_correct?
        expect(result).to eq(false)
      end
    end

    context "when the game is over" do
      context "when player has died" do
        it "return true" do
          state.lives = 0
          result = state.game_over?
          expect(result).to eq(true)
        end
      end

      context "when player guesses the word" do
        it "returns true" do
          allow(WordGenerator).to receive(:random_word).and_return("flux")
          allow(state).to receive(:correct_letters).and_return(["f", "l", "u", "x"]) # not sure
          result = state.game_over?
          expect(result).to eq(true)
        end
      end
    end
  end
end
