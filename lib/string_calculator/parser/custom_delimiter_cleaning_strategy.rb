# frozen_string_literal: true

require_relative 'cleaning_strategy'

module StringCalculator
  module Parser
    class CustomDelimiterCleaningStrategy
      include CleaningStrategy

      def applies_to?(input)
        input.start_with?('//')
      end

      def clean(input)
        input.split("\n", 2)[1] || ''
      end
    end
  end
end
