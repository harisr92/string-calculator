# frozen_string_literal: true

RSpec.describe StringCalculator::Parser::DelimiterParser do
  describe '#parse' do
    it 'parses a string with custom single-character delimiter' do
      parser = described_class.new("//;\n1;2;3")
      expect(parser.parse).to eq([';', "\n"])
    end

    context 'with multi-character custom delimiter' do
      it 'parses a string with multi-character custom delimiter' do
        parser = described_class.new("//[***]\n1***2***3")
        expect(parser.parse).to eq(['***', "\n"])
      end
    end

    context 'with multiple custom delimiters' do
      it 'parses a string with multiple custom delimiters' do
        parser = described_class.new("//[*][%%]\n1*2%%3")
        expect(parser.parse).to eq(['*', '%%', "\n"])
      end
    end

    it 'returns default delimiters for a string without custom delimiter' do
      parser = described_class.new("1,2\n3")
      expect(parser.parse).to eq([',', "\n"])
    end
  end
end
