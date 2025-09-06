# frozen_string_literal: true

# Calculator class responsible for performing mathematical operations on arrays of numbers.

module StringCalculator
  class Calculator
    def sum(numbers)
      numbers.sum do |num|
        if num.length == 3
          internal_operate(*num)
        else
          num.first
        end
      end
    end

    private

    def internal_operate(num1, operator, num2)
      case operator
      when '+'
        num1 + num2
      when '-'
        num1 - num2
      when '*'
        num1 * num2
      when '/'
        raise ZeroDivisionError, 'Division by zero is not allowed' if num2.zero?

        num1 / num2
      else
        raise ArgumentError, "Unsupported operator: #{operator}"
      end
    end
  end
end
