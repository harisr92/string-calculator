# frozen_string_literal: true

RSpec.describe StringCalculator::Calculator do
  let(:calculator) { described_class.new }

  describe '#sum' do
    it 'returns the sum of numbers' do
      expect(calculator.sum([[1], [2], [3]])).to eq(6)
    end

    it 'returns 0 for empty array' do
      expect(calculator.sum([])).to eq(0)
    end

    it 'handles single number' do
      expect(calculator.sum([[5]])).to eq(5)
    end

    it 'handles negative numbers' do
      expect(calculator.sum([[-1], [2], [-3]])).to eq(-2)
    end
  end
end
