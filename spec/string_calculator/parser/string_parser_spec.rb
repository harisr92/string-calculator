RSpec.describe StringCalculator::Parser::StringParser do
  describe '#parse' do
    it 'parses a comma-separated string into an array of integers' do
      parser = described_class.new('1,2,3')
      expect(parser.parse).to eq([1, 2, 3])
    end

    it 'handles single number strings' do
      parser = described_class.new('5')
      expect(parser.parse).to eq([5])
    end

    it 'handles empty strings' do
      parser = described_class.new('')
      expect(parser.parse).to be_empty
    end
  end
end
