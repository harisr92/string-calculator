# frozen_string_literal: true

module StringCalculator
  module Validators
    class NegativeNumberValidator
      def validate!(numbers)
        negatives = numbers.map do |nums|
          negs = []

          negs.push(nums.first) if nums.first.negative?
          negs.push(nums.last) if nums.length == 3 && nums.last.negative?

          negs
        end
        negatives = negatives.flatten

        raise NegativeNumberError, negatives unless negatives.empty?
      end
    end
  end
end
