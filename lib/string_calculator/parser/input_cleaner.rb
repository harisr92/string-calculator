# frozen_string_literal: true

#  Cleans the input string by removing custom delimiter definitions.
module StringCalculator
  module Parser
    class InputCleaner
      def initialize(input)
        @input = input
      end

      def clean
        if @input.start_with?('//')
          @input.split("\n", 2)[1] || ''
        else
          @input
        end
      end
    end
  end
end
