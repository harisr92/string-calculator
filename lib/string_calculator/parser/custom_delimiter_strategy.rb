# frozen_string_literal: true

require_relative 'delimiter_strategy'

module StringCalculator
  module Parser
    class CustomDelimiterStrategy
      include DelimiterStrategy

      def applies_to?(input)
        input.start_with?('//')
      end

      def extract_delimiters(input)
        custom_delimiter = input[2]
        [custom_delimiter, "\n"]
      end
    end
  end
end
