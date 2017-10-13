RSpec.describe GameBehaviour do
  context "when checking the word" do
    it "is correct" do
      letters = ["f", "l", "u", "x"]
      correct_letters = ["f", "l", "u", "x"]
      result = GameBehaviour.word_correct?(correct_letters, letters)
      expect(result).to eq(true)
    end

    it "is not correct" do
      letters = ["f", "l", "u", "x"]
      correct_letters = ["f"]
      result = GameBehaviour.word_correct?(correct_letters, letters)
      expect(result).to eq(false)
    end
  end

  context "when the game is over" do
    let(:letters) { ["f", "l", "u", "x"] }

    context "when player has died" do
      it "return true" do
        correct_letters = ["f", "x"]
        result = GameBehaviour.game_over?(0, correct_letters, letters)
        expect(result).to eq(true)
      end
    end

    context "when player guesses the word" do
      it "returns true" do
        correct_letters = ["f", "l", "u", "x"] # guessed_letters
        result = GameBehaviour.game_over?(4, correct_letters, letters)
        expect(result).to eq(true)
      end
    end
  end

  it "player is dead" do
    expect(GameBehaviour.dead?(0)).to eq(true)
  end

  it "descreases number of lives" do
    lives = 3
    expect(GameBehaviour.remove_life(lives)).to eq(2)
  end
end
