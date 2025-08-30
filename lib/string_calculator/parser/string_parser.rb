# frozen_string_literal: true

# lib/string_parser.rb

module StringCalculator
  module Parser
    class StringParser
      def initialize(input)
        @input = input
      end

      def parse
        @input.split(',').map { |num| num.strip.split.join.to_i }
      end
    end
  end
end
