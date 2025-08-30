# frozen_string_literal: true

# A simple runner class that takes an array of numbers and returns their sum.

module StringCalculator
  class Runner
    attr_reader :input

    def self.run(input)
      runner = new(input)

      runner.execute
    end

    # Initializes the Runner with the given input in array of numbers.
    def initialize(input)
      @input = input
    end

    def execute
      input.sum
    end
  end
end
