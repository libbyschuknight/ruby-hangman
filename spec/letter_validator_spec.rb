require "spec_helper"

RSpec.describe LetterValidator do
  describe "validating a letter" do
    context "when an alpha character" do
      it "returns true when an alpha character" do
        validator = LetterValidator.new("a")
        result = validator.alpha_character?
        expect(result).to eq(true)
      end

      it "returns false when not an alpha character" do
        validator = LetterValidator.new("&")
        result = validator.alpha_character?
        expect(result).to eq(false)
      end
    end

    context "when checking number of characters" do
      it "returns true when is one character" do
        validator = LetterValidator.new("a")
        result = validator.one_character?
        expect(result).to eq(true)
      end

      it "returns false when is more than one character" do
        validator = LetterValidator.new("aa")
        result = validator.one_character?
        expect(result).to eq(false)
      end
    end

    context "when checking if letter has beed used" do
      it "returns true if tried" do
        correct_letters = ["e"]
        incorrect_letters = []
        validator = LetterValidator.new("e")
        result = validator.already_tried?(correct_letters, incorrect_letters)
        expect(result).to eq(true)
      end

      it "returns false if has not been tried" do
        validator = LetterValidator.new("e")
        result = validator.already_tried?([], [])
        expect(result).to eq(false)
      end
    end
  end
end
