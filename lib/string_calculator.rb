# frozen_string_literal: true

require_relative 'string_calculator/parser/string_parser'
require_relative 'string_calculator/parser/delimiter_parser'
require_relative 'string_calculator/parser/input_cleaner'
require_relative 'string_calculator/calculator'
require_relative 'string_calculator/runner'

module StringCalculator
  VERSION = '0.0.1'

  class << self
    def add(input)
      delimiters = Parser::DelimiterParser.new(input).parse
      cleaned_input = Parser::InputCleaner.new(input).clean

      parser = Parser::StringParser.new(cleaned_input, delimiters)
      calculator = Calculator.new

      Runner.new(parser: parser, calculator: calculator).execute
    end
  end
end
