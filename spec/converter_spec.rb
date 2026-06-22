require 'spec_helper'

describe CsvToJsonConverter::Converter do
  let(:converter) { described_class.new }

  describe '#convert' do
    it 'converts a CSV file to JSON' do
      input_file = 'spec/fixtures/input.csv'
      output_file = 'spec/fixtures/output.json'
      expect(converter.convert(input_file, output_file)).to be_a(String)
    end

    it 'raises an error if the input file does not exist' do
      input_file = 'nonexistent.csv'
      output_file = 'output.json'
      expect { converter.convert(input_file, output_file) }.to raise_error(Errno::ENOENT)
    end
  end

  describe '#validate' do
    it 'validates a CSV file' do
      input_file = 'spec/fixtures/input.csv'
      expect(converter.validate(input_file)).to eq([])
    end

    it 'raises an error if the input file does not exist' do
      input_file = 'nonexistent.csv'
      expect { converter.validate(input_file) }.to raise_error(Errno::ENOENT)
    end
  end
end