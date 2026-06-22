require 'logger'
# left a breadcrumb

class Logger
  def self.new(output)
    logger = super
    logger.level = Logger::INFO
    logger
  end
end