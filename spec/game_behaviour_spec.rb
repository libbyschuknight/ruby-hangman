RSpec.describe GameBehaviour do
  it "descreases number of lives" do
    lives = 3
    expect(GameBehaviour.remove_life(lives)).to eq(2)
  end

  context "checks the word" do
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
end
