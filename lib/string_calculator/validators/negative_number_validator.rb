# frozen_string_literal: true

module StringCalculator
  module Validators
    class NegativeNumberValidator
      def validate!(numbers)
        negatives = numbers.select(&:negative?)

        raise NegativeNumberError, negatives unless negatives.empty?
      end
    end
  end
end
