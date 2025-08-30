require_relative '../lib/string_calculator/parser/string_parser.rb'

RSpec.describe StringCalculator::Parser::String_Parser do
  describe '#parse' do
    it 'parses a comma-separated string into an array of integers' do
      parser = StringCalculator::Parser::String_Parser.new('1,2,3')
      expect(parser.parse).to eq([1, 2, 3])
    end

    it 'handles single number strings' do
      parser = StringCalculator::Parser::String_Parser.new('5')
      expect(parser.parse).to eq([5])
    end

    it 'handles empty strings' do
      parser = StringCalculator::Parser::String_Parser.new('')
      expect(parser.parse).to eq([0])
    end
  end
end
