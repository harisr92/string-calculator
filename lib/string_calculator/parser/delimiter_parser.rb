# frozen_string_literal: true

require_relative 'default_delimiter_strategy'
require_relative 'custom_delimiter_strategy'

module StringCalculator
  module Parser
    class DelimiterParser
      def initialize(input, strategies = nil)
        @input = input
        @strategies = strategies || default_strategies
      end

      def parse
        strategy = find_applicable_strategy
        strategy.extract_delimiters(@input).uniq
      end

      private

      def find_applicable_strategy
        @strategies.find { |strategy| strategy.applies_to?(@input) } ||
          raise(ArgumentError, 'No applicable delimiter strategy found')
      end

      def default_strategies
        [
          CustomDelimiterStrategy.new,
          DefaultDelimiterStrategy.new
        ]
      end
    end
  end
end
