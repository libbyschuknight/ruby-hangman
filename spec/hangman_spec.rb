RSpec.describe Hangman do
  before do
    allow(STDIN).to receive(:gets).and_return("f\n")
  end

  let(:game) { Hangman.new("word") }

  describe "game is over" do
    context "when player is dead" do
      it "returns true" do
        allow(game).to receive(:dead?).and_return(true)
        expect(game.game_over?).to eq(true)
      end
    end

    context "when player gets word correct" do
      it "returns true" do
        allow(game).to receive(:word_correct?).and_return(true)
        expect(game.game_over?).to eq(true)
      end
    end
  end

  describe "check to see if letter is correct" do
    it "is correct" do
      result = game.correct_letter?("r")
      expect(result).to eq(true)
    end

    it "is not correct" do
      result = game.correct_letter?("f")
      expect(result).to eq(false)
    end
  end

  describe "collecting letters" do
    it "returns collection of letters" do
      collection = []
      result = game.collect_letters("r", collection)
      expect(result).to eq(["r"])
    end
  end

  # describe "correct letters" do
  #   it "collects letters" do
  #     result = game.correct_letters("r")
  #     expect(result).to eq(["r"])
  #   end
  # end
  #
  # describe "incorrect letters letters" do
  #   it "collects letters" do
  #     result = game.incorrect_letters("r")
  #     expect(result).to eq(["r"])
  #   end
  # end
end
