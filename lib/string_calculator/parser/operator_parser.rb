# frozen_string_literal: true

# lib/operator_parser.rb

module StringCalculator
  class OperatorParser
    def initialize(str)
      @input = str
    end

    def parse
      if (match = @input.match(%r{(?<=\d|\))([+/*-])}))
        match[1]
      end
    end
  end
end
