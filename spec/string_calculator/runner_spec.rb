# frozen_string_literal: true

RSpec.describe StringCalculator::Runner do
  describe '.run' do
    it 'returns the sum of numbers in a comma-separated string' do
      expect(described_class.run([1, 2, 3])).to eq(6)
    end

    it 'returns 0 for an empty string' do
      expect(described_class.run([])).to eq(0)
    end

    it 'handles single number strings' do
      expect(described_class.run([5])).to eq(5)
    end
  end
end
