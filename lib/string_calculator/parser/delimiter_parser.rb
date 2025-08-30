# frozen_string_literal: true

# Parses custom delimiters from the input string

module StringCalculator
  module Parser
    class DelimiterParser
      def initialize(input)
        @input = input
      end

      def parse
        delimiters = ["\n"]

        if @input.start_with?('//')
          delimiters.unshift(@input[2])
        else
          delimiters.unshift(',')
        end

        delimiters.uniq
      end
    end
  end
end
