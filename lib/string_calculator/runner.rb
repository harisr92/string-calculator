# frozen_string_literal: true

# A runner class that orchestrates parsing and calculation operations.

module StringCalculator
  class Runner
    def initialize(parser:, calculator:)
      @parser = parser
      @calculator = calculator
    end

    def execute
      parsed_numbers = parser.parse
      calculator.sum(parsed_numbers)
    end

    private

    attr_reader :parser, :calculator
  end
end
