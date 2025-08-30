# frozen_string_literal: true

require_relative 'string_calculator/parser/string_parser'
require_relative 'string_calculator/calculator'
require_relative 'string_calculator/runner'

module StringCalculator
  VERSION = '0.0.1'

  class << self
    def add(input)
      parser = Parser::StringParser.new(input)
      calculator = Calculator.new

      Runner.new(parser: parser, calculator: calculator).execute
    end
  end
end
