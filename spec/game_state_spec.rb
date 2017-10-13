RSpec.describe GameState do
  describe "initializing a game state" do
    let(:game_state) { GameState.new }

    it "had letters" do
      allow(WordGenerator).to receive(:random_word).and_return("flux")
      expect(game_state.letters).to eq(["f", "l", "u", "x"])
    end

    it "has ten lives" do
      expect(game_state.lives).to eq(10)
    end

    it "has correct letters" do
      expect(game_state.correct_letters).to eq([])
    end

    it "has incorrect letters" do
      expect(game_state.incorrect_letters).to eq([])
    end
  end
end
