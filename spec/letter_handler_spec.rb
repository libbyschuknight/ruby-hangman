RSpec.describe LetterHandler do
  describe "checking if the letter is in word" do
    it "letter is in the word" do
      handler = LetterHandler.new
      result = handler.letter_in_word?("r", "word".chars)
      expect(result).to eq(true)
    end

    it "letter is not in the word" do
      handler = LetterHandler.new
      result = handler.letter_in_word?("b", "word".chars)
      expect(result).to eq(false)
    end
  end
end
