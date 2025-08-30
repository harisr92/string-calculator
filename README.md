# String Calculator TDD

A Ruby implementation of the [String Calculator](https://blog.incubyte.co/blog/tdd-assessment/) by Incubyte.

## Overview

This is designed to practice Test Driven Development (TDD) by implementing a string calculator that can add numbers provided as a string with various delimiters.

## Requirements

This should be solved incrementally, following TDD principles:

### Step 1: Basic Addition
- Create a method `add(numbers)` that takes a string of numbers
- Return 0 for empty string
- Return the number itself for single number
- Return sum for two comma-separated numbers
- Examples: `""` → `0`, `"1"` → `1`, `"1,2"` → `3`

### Step 2: Handle Unknown Amount of Numbers
- Allow the `add` method to handle any number of comma-separated numbers
- Example: `"1,2,3,4,5"` → `15`

### Step 3: Handle New Line Delimiters
- Support newlines as delimiters between numbers
- Allow mixing commas and newlines
- Example: `"1\n2,3"` → `6`
- Invalid input like `"1,\n"` should be handled appropriately

### Step 4: Support Custom Delimiters
- Allow defining custom single-character delimiters
- Format: `"//[delimiter]\n[numbers]"`
- Example: `"//;\n1;2"` → `3`

### Step 5: Handle Negative Numbers
- Throw an exception when negative numbers are present
- Exception message should include all negative numbers found
- Example: `"1,-2,3,-4"` should throw exception with message including "-2" and "-4"

### Step 6: Ignore Numbers Greater Than 1000
- Numbers > 1000 should be ignored in the calculation
- Example: `"2,1001"` → `2`

### Step 7: Support Multi-Character Delimiters
- Allow delimiters of any length
- Format: `"//[***]\n1***2***3"` → `6`

### Step 8: Support Multiple Delimiters
- Allow multiple single-character delimiters
- Format: `"//[*][%]\n1*2%3"` → `6`

### Step 9: Support Multiple Multi-Character Delimiters
- Combine steps 7 and 8
- Example: `"//[**][%%]\n1**2%%3"` → `6`

## Project Structure

```
├── lib/
│   └── string_calculator.rb          # String calculator implementation
├── spec/
│   ├── string_calculator_spec.rb     # RSpec tests
│   └── spec_helper.rb                # Test configuration
├── Gemfile                           # Ruby dependencies
└── README.md                         # This file
```

## Setup

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Run tests:
   ```bash
   bundle exec rspec
   ```

## TDD Process

Follow these TDD principles while implementing:

1. **Red**: Write a failing test
2. **Green**: Write minimal code to make it pass
3. **Refactor**: Clean up code while keeping tests green
4. Repeat for each requirement

## Key Rules

- Start simple and build incrementally
- Only write code that makes a failing test pass
- Refactor only after tests are passing
- Handle edge cases as specified in requirements
- Focus on correct inputs as specified in each step
