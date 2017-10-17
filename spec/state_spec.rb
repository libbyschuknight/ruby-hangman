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
end
