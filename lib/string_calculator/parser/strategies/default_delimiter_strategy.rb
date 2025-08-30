# frozen_string_literal: true

require_relative 'delimiter_strategy'

module StringCalculator
  module Parser
    class DefaultDelimiterStrategy
      include DelimiterStrategy

      def applies_to?(input)
        !input.start_with?('//')
      end

      def extract_delimiters(_input)
        [',', "\n"]
      end
    end
  end
end
