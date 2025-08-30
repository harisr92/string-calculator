# frozen_string_literal: true

module StringCalculator
  module Parser
    module DelimiterStrategy
      def applies_to?(input)
        raise NotImplementedError, 'Subclasses must implement applies_to?'
      end

      def extract_delimiters(input)
        raise NotImplementedError, 'Subclasses must implement extract_delimiters'
      end
    end
  end
end
