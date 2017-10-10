RSpec.describe Hangman do
  describe "game is over" do
    context "when player is dead" do
      it "returns true" do
        allow(STDIN).to receive(:gets).and_return("f\n")
        # game = instance_double("Hangman", game_over?: nil)
        game = Hangman.new("word")
        allow(game).to receive(:dead?).and_return(true)
        expect(game.game_over?).to eq(true)
      end
    end

    context "when player gets word correct" do
      it "returns true" do
        allow(STDIN).to receive(:gets).and_return("f\n")
        game = Hangman.new("word")
        allow(game).to receive(:word_correct?).and_return(true)
        expect(game.game_over?).to eq(true)
      end
    end
  end
end
