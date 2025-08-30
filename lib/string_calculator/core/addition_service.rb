# frozen_string_literal: true

require_relative '../factories/component_factory'
require_relative '../core/runner'

module StringCalculator
  class AdditionService
    def initialize(factory = nil)
      @factory = factory || ComponentFactory.new
    end

    def add(input)
      delimiters = factory.create_delimiter_parser(input).parse
      cleaned_input = factory.create_input_cleaner(input).clean

      parser = factory.create_string_parser(cleaned_input, delimiters)
      calculator = factory.create_calculator

      Runner.new(parser: parser, calculator: calculator).execute
    end

    private

    attr_reader :factory
  end
end
