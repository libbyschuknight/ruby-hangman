RSpec.describe Hangman do
  before do
    # allow not working, change what happens in class
    allow_any_instance_of(Hangman).to receive(:random_word).and_return("flux")
  end

  let(:game) { Hangman.new }

  describe "initializing a game" do
    it "had letters" do
      expect(game.letters).to eq(["f", "l", "u", "x"])
    end
    it "has 8 lives" do
      expect(game.lives).to eq(8)
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
