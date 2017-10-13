RSpec.describe GameState do
  describe "initializing a game state" do
    let(:game_state) { GameState.new }
    it "had letters" do
      # allow not working, change what happens in class
      allow_any_instance_of(GameState).to receive(:random_word).and_return("flux")
      expect(game_state.letters).to eq(["f", "l", "u", "x"])
    end

    it "has ten lives" do
      expect(game_state.lives).to eq(10)
    end
  end
end
