# frozen_string_literal: true

# lib/string_parser.rb

module StringCalculator
  module Parser
    class StringParser
      def initialize(input)
        @input = input
      end

      def parse
        @input.split(splitter).map { |num| num.strip.split.join.to_i }
      end

      private

      def splitter
        /,|\n/
      end
    end
  end
end
