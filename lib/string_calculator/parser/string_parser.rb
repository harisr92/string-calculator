# frozen_string_literal: true

# lib/string_parser.rb

require_relative 'operator_parser'

module StringCalculator
  module Parser
    class StringParser
      def initialize(input, delimiters = [])
        @input = input
        @delimiters = delimiters
      end

      def parse
        tokens = @input.split(splitter).map { |token| parse_token(token.strip.split.join) }
        tokens.compact
      end

      private

      def parse_token(str)
        operator = OperatorParser.new(str).parse

        if operator
          parse_operator_expression(str, operator)
        else
          parse_simple_number(str)
        end
      end

      def parse_operator_expression(str, operator)
        numbers = extract_numbers_from_expression(str, operator)
        return nil if numbers.empty?

        build_operator_result(numbers, operator)
      end

      def extract_numbers_from_expression(str, operator)
        str.split(operator_splitter(operator))
           .map(&:to_i)
           .select { |num| num <= 1000 }
      end

      def build_operator_result(numbers, operator)
        return nil if numbers.empty?

        result = [numbers.first]
        if numbers.length == 2
          result << operator
          result << numbers.last
        end
        result
      end

      def parse_simple_number(str)
        number = str.to_i
        number > 1000 ? nil : [number]
      end

      def splitter
        if @delimiters.nil? || @delimiters.empty?
          /,|\n/
        else
          Regexp.union(@delimiters)
        end
      end

      def operator_splitter(operator)
        Regexp.new("\\#{operator}")
      end
    end
  end
end
