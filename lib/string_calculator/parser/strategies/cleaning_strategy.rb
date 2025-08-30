# frozen_string_literal: true

module StringCalculator
  module Parser
    module CleaningStrategy
      def applies_to?(input)
        raise NotImplementedError, 'Subclasses must implement applies_to?'
      end

      def clean(input)
        raise NotImplementedError, 'Subclasses must implement clean'
      end
    end
  end
end
