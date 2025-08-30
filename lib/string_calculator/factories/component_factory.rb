# frozen_string_literal: true

require_relative '../parser/delimiter_parser'
require_relative '../parser/input_cleaner'
require_relative '../parser/string_parser'
require_relative '../core/calculator'

module StringCalculator
  class ComponentFactory
    def create_delimiter_parser(input)
      Parser::DelimiterParser.new(input)
    end

    def create_input_cleaner(input)
      Parser::InputCleaner.new(input)
    end

    def create_string_parser(cleaned_input, delimiters)
      Parser::StringParser.new(cleaned_input, delimiters)
    end

    def create_calculator
      Calculator.new
    end
  end
end
