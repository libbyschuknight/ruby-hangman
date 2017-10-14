require "spec_helper"

RSpec.describe LetterValidator do
  describe "validating a letter" do
    context "when alpha character" do
      it "returns true when an alpha character" do
        validator = LetterValidator.new("a")
        result = validator.alpha_char?
        expect(result).to eq(true)
      end

      it "returns false when not an alpha character" do
        validator = LetterValidator.new("&")
        result = validator.alpha_char?
        expect(result).to eq(false)
      end
    end
  end
end
