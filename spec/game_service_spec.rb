require "spec_helper"

RSpec.describe GameService do
  context "when checking the word" do
    it "is correct" do
      letters = ["f", "l", "u", "x"]
      correct_letters = ["f", "l", "u", "x"]
      result = GameService.word_correct?(correct_letters, letters)
      expect(result).to eq(true)
    end

    it "is not correct" do
      letters = ["f", "l", "u", "x"]
      correct_letters = ["f"]
      result = GameService.word_correct?(correct_letters, letters)
      expect(result).to eq(false)
    end
  end

  context "when the game is over" do
    let(:letters) { ["f", "l", "u", "x"] }

    context "when player has died" do
      it "return true" do
        correct_letters = ["f", "x"]
        result = GameService.game_over?(0, correct_letters, letters)
        expect(result).to eq(true)
      end
    end

    context "when player guesses the word" do
      it "returns true" do
        correct_letters = ["f", "l", "u", "x"] # guessed_letters
        result = GameService.game_over?(4, correct_letters, letters)
        expect(result).to eq(true)
      end
    end
  end

  it "player is dead" do
    expect(GameService.dead?(0)).to eq(true)
  end

  it "descreases number of lives" do
    lives = 3
    expect(GameService.remove_life(lives)).to eq(2)
  end
end
