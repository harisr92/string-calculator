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
        delimiter_section, = input.split("\n", 2)
        custom_delimiter =
          if delimiter_section.start_with?('//[') && delimiter_section.end_with?(']')
            delimiter_section[3..-2]
          else
            delimiter_section[2]
          end

        [custom_delimiter, "\n"]
      end
    end
  end
end
