# frozen_string_literal: true

require_relative 'string_calculator/parser/string_parser'
require_relative 'string_calculator/parser/delimiter_parser'
require_relative 'string_calculator/parser/input_cleaner'
require_relative 'string_calculator/calculator'
require_relative 'string_calculator/runner'
require_relative 'string_calculator/addition_service'
require_relative 'string_calculator/errors'

module StringCalculator
  VERSION = '0.0.1'

  class << self
    def add(input, service = nil)
      service ||= AdditionService.new
      service.add(input)
    end
  end
end
