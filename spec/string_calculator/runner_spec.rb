# frozen_string_literal: true

RSpec.describe StringCalculator::Runner do
  describe '#execute' do
    let(:mock_parser) { instance_double(StringCalculator::Parser::StringParser, parse: [1, 2, 3]) }
    let(:mock_calculator) { instance_double(StringCalculator::Calculator, sum: 6) }

    it 'uses the injected parser to parse input' do
      runner = described_class.new(parser: mock_parser, calculator: mock_calculator)
      expect(runner.execute).to eq(6)
      expect(mock_parser).to have_received(:parse)
    end

    it 'uses injected calculator for computation' do
      runner = described_class.new(parser: mock_parser, calculator: mock_calculator)
      expect(runner.execute).to eq(6)
      expect(mock_calculator).to have_received(:sum).with([1, 2, 3])
    end
  end
end
