# frozen_string_literal: true

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

    it 'handles numbers with spaces' do
      parser = described_class.new(' 1 , 2 , 3 2 ')
      expect(parser.parse).to eq([1, 2, 32])
    end

    it 'handles seperators as new lines and commas' do
      parser = described_class.new("1\n2,3")
      expect(parser.parse).to eq([1, 2, 3])
    end

    context 'with custom delimiter' do
      let(:delimiters) { [';', "\n"] }

      it 'handles custom single-character delimiters' do
        parser = described_class.new('1;2;3', delimiters)
        expect(parser.parse).to eq([1, 2, 3])
      end
    end

    context 'when numbers are bigger than 1000' do
      it 'includes numbers less than or equal to 1000' do
        parser = described_class.new('2,1000,6')
        expect(parser.parse).to eq([2, 1000, 6])
      end

      it 'ignores numbers greater than 1000' do
        parser = described_class.new('2,1001,6')
        expect(parser.parse).to eq([2, 6])
      end
    end
  end
end
