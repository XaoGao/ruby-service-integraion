module Settings
  class InnerSystem
    attr_reader :intervals

    def initialize(inner_system)
      raise Error "inner_system can not be nil" if inner_system.nil?
      raise Error "intervalis can not be nil" if inner_system[:intervals].nil?

      @intervals = inner_system[:intervals][:interval].map { |i| Interval.new(i) }
    end
  end
end
