# frozen_string_literal: true

RSpec.describe StringCalculator::Validators do
  describe '.validate' do
    let(:mock_negative_validator) { instance_double(StringCalculator::Validators::NegativeNumberValidator) }

    before do
      allow(
        StringCalculator::Validators::NegativeNumberValidator
      ).to receive(:new).and_return(mock_negative_validator)
    end

    it 'delegates validation to NegativeNumberValidator' do
      numbers = [1, -2, 3]
      allow(mock_negative_validator).to receive(:validate!).with(numbers)

      StringCalculator::Validators.validate(numbers)

      expect(mock_negative_validator).to have_received(:validate!).with(numbers)
    end
  end
end
