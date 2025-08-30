# frozen_string_literal: true

RSpec.describe StringCalculator::Validators::NegativeNumberValidator do
  describe '#validate!' do
    let(:validator) { described_class.new }

    context 'when there are no negative numbers' do
      it 'does not raise an error' do
        expect { validator.validate!([1, 2, 3]) }.not_to raise_error
      end
    end

    context 'when there are negative numbers' do
      it 'raises a NegativeNumberError with the negative numbers' do
        expect { validator.validate!([1, -2, 3, -4]) }
          .to raise_error(StringCalculator::NegativeNumberError, 'Negatives not allowed: -2, -4')
      end
    end

    context 'when all numbers are negative' do
      it 'raises a NegativeNumberError with all the negative numbers' do
        expect { validator.validate!([-1, -2, -3]) }
          .to raise_error(StringCalculator::NegativeNumberError, 'Negatives not allowed: -1, -2, -3')
      end
    end

    context 'when the list is empty' do
      it 'does not raise an error' do
        expect { validator.validate!([]) }.not_to raise_error
      end
    end

    context 'when there are zero and positive numbers' do
      it 'does not raise an error' do
        expect { validator.validate!([0, 1, 2]) }.not_to raise_error
      end
    end
  end
end
