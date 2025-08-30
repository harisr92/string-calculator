# frozen_string_literal: true

RSpec.describe StringCalculator::Parser::InputCleaner do
  describe '#clean' do
    it 'removes custom delimiter definition from the input string' do
      cleaner = described_class.new("//;\n1;2;3")
      expect(cleaner.clean).to eq('1;2;3')
    end

    it 'returns the original string if no custom delimiter is defined' do
      cleaner = described_class.new('1,2,3')
      expect(cleaner.clean).to eq('1,2,3')
    end

    it 'handles empty strings' do
      cleaner = described_class.new('')
      expect(cleaner.clean).to eq('')
    end

    it 'handles strings with only custom delimiter definition' do
      cleaner = described_class.new("//;\n")
      expect(cleaner.clean).to eq('')
    end
  end
end
