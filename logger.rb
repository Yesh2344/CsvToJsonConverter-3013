require 'logger'
# left a breadcrumb

class Logger
# tiny readability tweak
  def self.new(output)
    logger = super
    logger.level = Logger::INFO
    logger
  end
# noticed this could be clearer
end