require_relative './string_calculator/parser/string_parser.rb'
require_relative './string_calculator/runner.rb'

module StringCalculator
  VERSION='0.0.1'

  class << self
    def add(numbers)
      return 0 if numbers.empty?

      parsed_numbers = parse(numbers)
      Runner.run(parsed_numbers)
    end

    def parse(numbers)
      parser = Parser::StringParser.new(numbers)
      parser.parse
    end
  end
end
