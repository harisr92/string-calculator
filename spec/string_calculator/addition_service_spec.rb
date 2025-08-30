# frozen_string_literal: true

RSpec.describe StringCalculator::AdditionService do
  let(:service) { described_class.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(service.add('')).to eq(0)
    end

    it 'returns the number for a single number string' do
      expect(service.add('5')).to eq(5)
    end

    it 'returns the sum for two comma-separated numbers' do
      expect(service.add('2,3')).to eq(5)
    end

    it 'returns the sum for multiple comma-separated numbers' do
      expect(service.add('1,2,3,4,5')).to eq(15)
    end

    it 'handles numbers with spaces' do
      expect(service.add(' 1 , 2 , 3 2 ')).to eq(35)
    end

    it 'handles new lines as separators' do
      expect(service.add("1\n2,3")).to eq(6)
    end

    it 'handles custom single-character delimiters' do
      expect(service.add("//;\n1;2;3")).to eq(6)
    end
  end

  describe 'dependency injection' do
    let(:mock_factory) { instance_double(StringCalculator::ComponentFactory) }
    let(:mock_delimiter_parser) { instance_double(StringCalculator::Parser::DelimiterParser) }
    let(:mock_input_cleaner) { instance_double(StringCalculator::Parser::InputCleaner) }
    let(:mock_string_parser) { instance_double(StringCalculator::Parser::StringParser) }
    let(:mock_calculator) { instance_double(StringCalculator::Calculator) }
    let(:mock_runner) { instance_double(StringCalculator::Runner) }

    let(:service_with_factory) { described_class.new(mock_factory) }

    before do
      allow(mock_factory).to receive(:create_delimiter_parser).and_return(mock_delimiter_parser)
      allow(mock_factory).to receive(:create_input_cleaner).and_return(mock_input_cleaner)
      allow(mock_factory).to receive(:create_string_parser).and_return(mock_string_parser)
      allow(mock_factory).to receive(:create_calculator).and_return(mock_calculator)

      allow(mock_delimiter_parser).to receive(:parse).and_return([',', "\n"])
      allow(mock_input_cleaner).to receive(:clean).and_return('1,2,3')
      allow(StringCalculator::Runner).to receive(:new).and_return(mock_runner)
      allow(mock_runner).to receive(:execute).and_return(42)
    end

    it 'uses injected factory to create components' do
      input = '1,2,3'

      expect(mock_factory).to receive(:create_delimiter_parser).with(input)
      expect(mock_factory).to receive(:create_input_cleaner).with(input)
      expect(mock_factory).to receive(:create_string_parser).with('1,2,3', [',', "\n"])
      expect(mock_factory).to receive(:create_calculator)

      service_with_factory.add(input)
    end

    it 'returns result from runner execution' do
      expect(service_with_factory.add('1,2,3')).to eq(42)
    end
  end

  describe 'with default factory' do
    it 'creates default factory when none provided' do
      expect(StringCalculator::ComponentFactory).to receive(:new).and_call_original
      described_class.new
    end
  end
end
