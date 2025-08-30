# frozen_string_literal: true

require_relative 'validators/validate'

# A runner class that orchestrates parsing and calculation operations.
module StringCalculator
  class Runner
    def initialize(parser:, calculator:)
      @parser = parser
      @calculator = calculator
    end

    def execute
      parsed_numbers = parser.parse

      Validators.validate(parsed_numbers)
      calculator.sum(parsed_numbers)
    end

    private

    attr_reader :parser, :calculator
  end
end
