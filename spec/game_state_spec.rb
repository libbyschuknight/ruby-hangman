RSpec.describe GameState do
  describe "initializing a game state" do
    it "had letters" do
      # allow not working, change what happens in class
      allow_any_instance_of(GameState).to receive(:random_word).and_return("flux")
      game_state = GameState.new
      expect(game_state.letters).to eq(["f", "l", "u", "x"])
    end
  end
end
