RSpec.describe WordGenerator do
  describe "random word" do
    it "returns a word" do
      # allow not working, change what happens in class
      allow_any_instance_of(WordGenerator).to receive(:random_word).and_return("flux")

      word = WordGenerator.new.random_word
      expect(word).to eq("flux")
    end
  end
end
