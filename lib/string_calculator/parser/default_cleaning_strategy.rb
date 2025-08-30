# frozen_string_literal: true

require_relative 'cleaning_strategy'

module StringCalculator
  module Parser
    class DefaultCleaningStrategy
      include CleaningStrategy

      def applies_to?(input)
        !input.start_with?('//')
      end

      def clean(input)
        input
      end
    end
  end
end
