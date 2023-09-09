module Settings
  class Config
    attr_reader :sellers

    def initialize(config)
      raise Error "config can not be nil" if config.nil?
      raise Error "sellers can not be nil" if config[:sellers][:seller].nil? || config[:sellers][:seller].empty?

      @sellers = sellers[:selllers][:seller].map { |s| Seller.new(s) }
    end
  end
end
