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
    let(:letter_handler) { instance_double("LetterHandler") }

    before do
      allow(LetterHandler).to receive(:new).and_return(letter_handler)
    end

    it "is correct" do
      allow(letter_handler).to receive(:letter_in_word?).and_return(true)
      result = game.correct_letter?("r")
      expect(result).to eq(true)
    end

    it "is not correct" do
      allow(letter_handler).to receive(:letter_in_word?).and_return(false)
      result = game.correct_letter?("f")
      expect(result).to eq(false)
    end
  end
end
