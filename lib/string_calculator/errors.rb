# frozen_string_literal: true

# Custom error class for handling negative numbers in StringCalculator
module StringCalculator
  class NegativeNumberError < StandardError
    def initialize(negatives)
      super("Negatives not allowed: #{negatives.join(', ')}")
    end
  end
end
