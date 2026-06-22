require 'csv_to_json_converter/converter'
require 'dotenv/load'

class Main
  def self.call(env)
    converter = CsvToJsonConverter::Converter.new
    input_file = ENV['INPUT_FILE'] || 'input.csv'
    output_file = ENV['OUTPUT_FILE'] || 'output.json'
    validate = ENV['VALIDATE'] == 'true'

    if validate
      errors = converter.validate(input_file)
      if errors.any?
        [500, {}, ["Validation errors: #{errors.join(', ')}"]]
      else
        json_data = converter.convert(input_file, output_file)
        [200, {}, [json_data]]
      end
    else
      json_data = converter.convert(input_file, output_file)
      [200, {}, [json_data]]
    end
  end
end