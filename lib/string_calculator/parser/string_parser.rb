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
        @input.split(splitter).map { |num| num.strip.split.join.to_i }
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
