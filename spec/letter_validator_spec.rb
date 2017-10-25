require "spec_helper"

RSpec.describe LetterValidator do
  describe "validating a letter" do
    let(:validator) { LetterValidator.new }
    let(:state) do
      instance_double(
        "State",
        all_letters: []
      )
    end

    context "when letter is valid" do
      it "returns true" do
        result = validator.validate(
          letter: "a",
          game_state: state
        )
        expect(result.success?).to eq(true)
      end
    end

    context "when letter is not valid" do
      context "when is a number or symbol" do
        it "returns false" do
          result = validator.validate(
            letter: "3",
            game_state: state
          )
          expect(result.success?).to eq(false)
        end
      end

      context "when is two or more characters" do
        it "returns false" do
          result = validator.validate(
            letter: "aa",
            game_state: state
          )
          expect(result.success?).to eq(false)
        end
      end

      context "when has already be tried" do
        it "returns false" do
          state = instance_double("State", all_letters: ["a"])
          result = validator.validate(
            letter: "a",
            game_state: state
          )
          expect(result.success?).to eq(false)
        end
      end
    end
  end
end
