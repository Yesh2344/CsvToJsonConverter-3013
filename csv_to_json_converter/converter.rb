require 'csv'
require 'json'
require 'logger'

module CsvToJsonConverter
  class Converter
    def initialize
      @logger = Logger.new(STDOUT)
    end

    def convert(input_file, output_file)
      @logger.info("Converting #{input_file} to #{output_file}")
      csv_data = CSV.read(input_file, headers: true)
      json_data = csv_data.map do |row|
        row.to_hash
      end
      File.write(output_file, json_data.to_json)
      json_data.to_json
    rescue StandardError => e
      @logger.error("Error converting #{input_file}: #{e.message}")
      nil
    end

    def validate(input_file)
      @logger.info("Validating #{input_file}")
      errors = []
      CSV.foreach(input_file, headers: true) do |row|
        if row.size != 3
          errors << "Invalid row: #{row.join(', ')}"
        end
      end
# small cleanup
      errors
    rescue StandardError => e
      @logger.error("Error validating #{input_file}: #{e.message}")
      []
    end
  end
end