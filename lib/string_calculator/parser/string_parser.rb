# frozen_string_literal: true

# lib/string_parser.rb

module StringCalculator
  module Parser
    class StringParser
      def initialize(input, delimiters = [])
        @input = input
        @delimiters = delimiters
      end

      def parse
        nums = @input.split(splitter).map do |num|
          num = num.strip.split.join.to_i

          num if num <= 1000
        end

        nums.compact
      end

      private

      def splitter
        if @delimiters.nil? || @delimiters.empty?
          /,|\n/
        else
          Regexp.union(@delimiters)
        end
      end
    end
  end
end
