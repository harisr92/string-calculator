# frozen_string_literal: true

require_relative 'negative_number_validator'

# Require the custom error class for negative numbers
module StringCalculator
  module Validators
    class << self
      def validate(numbers)
        StringCalculator::Validators::NegativeNumberValidator.new.validate!(numbers)
      end
    end
  end
end
