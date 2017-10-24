require "spec_helper"

RSpec.describe LetterValidator do
  describe "validating a letter" do
    let(:validator) { LetterValidator.new }

    context "when letter is valid" do
      it "result object returns true" do
        result = validator.validate(
          letter: "a",
          correct_letters: [],
          incorrect_letters: []
        )
        expect(result.success?).to eq(true)
      end
    end

    context "when letter is not valid" do
      context "when a number or symbol" do
        it "result object returns false" do
          result = validator.validate(
            letter: "3",
            correct_letters: [],
            incorrect_letters: []
          )
          expect(result.success?).to eq(false)
        end
      end

      context "when two or more characters" do
        it "result object returns false" do
          result = validator.validate(
            letter: "aa",
            correct_letters: [],
            incorrect_letters: []
          )
          expect(result.success?).to eq(false)
        end
      end

      context "when has already be tried" do
        it "result object returns false" do
          result = validator.validate(
            letter: "a",
            correct_letters: [],
            incorrect_letters: ["a"]
          )
          expect(result.success?).to eq(false)
        end
      end
    end
  end
end
