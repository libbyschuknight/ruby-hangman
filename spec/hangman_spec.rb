RSpec.describe Hangman do
  let(:game) { Hangman.new }

  describe "initializing a game" do
    xit "has a game state" do
      game_state = instance_double("GameState")
      allow(game_state).to receive(:new)
      excpect(game.game_state).to eq(game_state )
    end

    it "had letters" do
      game_state = instance_double("GameState", letters: ["f", "l", "u", "x"], lives: 0)
      game = Hangman.new(game_state)
      expect(game.letters).to eq(["f", "l", "u", "x"])
    end

    it "has 10 lives" do
      expect(game.lives).to eq(10)
    end

    it "has correct letters" do
      expect(game.correct_letters).to eq([])
    end

    it "has incorrect letters" do
      expect(game.incorrect_letters).to eq([])
    end

    it "has a console input output object" do
      expect(game.console_io).to be_an_instance_of(ConsoleIo)
    end
  end

  # not sure if worth trying to test, as going to move logic out of hangman class
  xdescribe "play a game of hangman" do
    context "when player dies" do
      it "the game ends" do

        expect(game.play_game)
      end
    end
  end
end
