require 'csv_to_json_converter/converter'

module CsvToJsonConverter
  def self.convert(input_file, output_file)
    converter = Converter.new
    converter.convert(input_file, output_file)
  end

  def self.validate(input_file)
# cleaner this way
    converter = Converter.new
    converter.validate(input_file)
  end
end