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

    it 'handles custom single-character delimiters' do
      expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
    end

    context 'when negative numbers are present' do
      it 'raises an error listing all negative numbers' do
        expect do
          StringCalculator.add('1,-2,3,-4')
        end.to raise_error(StringCalculator::NegativeNumberError,
                           'Negatives not allowed: -2, -4')
      end
    end

    context 'when numbers are bigger than 1000' do
      it 'ignores numbers greater than 1000' do
        expect(StringCalculator.add('2,1001,6')).to eq(8)
      end
    end

    context 'when multiple length delimiters are used' do
      it 'handles custom multi-character delimiters' do
        expect(StringCalculator.add("//[***]\n1***2***3\n5***6")).to eq(17)
      end
    end

    context 'when multiple delimiters are specified' do
      it 'handles multiple single-character delimiters' do
        expect(StringCalculator.add("//[*][%]\n1*2%3%20")).to eq(26)
      end

      it 'handles multiple multi-character delimiters' do
        expect(StringCalculator.add("//[**][%%]\n1**2%%3")).to eq(6)
      end
    end

    context 'handles other calculation operations' do
      it 'should run the calculations' do
        expect(StringCalculator.add('2*13,1')).to eq(27)
      end
    end
  end
end
