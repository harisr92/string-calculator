# frozen_string_literal: true

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number for a single number string' do
      expect(StringCalculator.add('5')).to eq(5)
    end

    it 'returns the sum for two comma-separated numbers' do
      expect(StringCalculator.add('2,3')).to eq(5)
    end

    it 'returns the sum for multiple comma-separated numbers' do
      expect(StringCalculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'handles numbers with spaces' do
      expect(StringCalculator.add(' 1 , 2 , 3 2 ')).to eq(35)
    end

    it 'handles new lines as separators' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end
  end
end
