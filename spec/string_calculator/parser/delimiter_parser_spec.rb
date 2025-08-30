# frozen_string_literal: true

RSpec.describe StringCalculator::Parser::DelimiterParser do
  describe '#parse' do
    it 'parses a string with custom single-character delimiter' do
      parser = described_class.new("//;\n1;2;3")
      expect(parser.parse).to eq([';', "\n"])
    end
  end
end
