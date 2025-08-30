# frozen_string_literal: true

require_relative 'custom_delimiter_cleaning_strategy'
require_relative 'default_cleaning_strategy'

module StringCalculator
  module Parser
    class InputCleaner
      def initialize(input, strategies = nil)
        @input = input
        @strategies = strategies || default_strategies
      end

      def clean
        strategy = find_applicable_strategy
        strategy.clean(@input)
      end

      private

      def find_applicable_strategy
        @strategies.find { |strategy| strategy.applies_to?(@input) } ||
          raise(ArgumentError, 'No applicable cleaning strategy found')
      end

      def default_strategies
        [
          CustomDelimiterCleaningStrategy.new,
          DefaultCleaningStrategy.new
        ]
      end
    end
  end
end
