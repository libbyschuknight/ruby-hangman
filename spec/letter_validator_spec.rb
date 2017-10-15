require "spec_helper"

RSpec.describe LetterValidator do
  describe "validating a letter" do
    context "when not an alpha character" do
      it "returns true" do
        validator = LetterValidator.new(output: ConsoleIo.new)
        result = validator.validate(
          letter: "3",
          correct_letters: [],
          incorrect_letters: []
        )
        expect(result).to eq(true)
      end
    end

    context "when two or more characters" do
      it "returns true" do
        validator = LetterValidator.new(output: ConsoleIo.new)
        result = validator.validate(
          letter: "aa",
          correct_letters: [],
          incorrect_letters: []
        )
        expect(result).to eq(true)
      end
    end

    context "when has already be tried" do
      it "returns true" do
        validator = LetterValidator.new(output: ConsoleIo.new)
        result = validator.validate(
          letter: "a",
          correct_letters: [],
          incorrect_letters: ["a"]
        )
        expect(result).to eq(true)
      end
    end
  end
end
