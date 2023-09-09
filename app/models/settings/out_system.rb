module Settings
  class OutSystem
    attr_reader :x_auth_token

    def initialize(out_system)
      raise Error "out system can not be nil or empty" if out_system.nil?

      @x_auth_token = out_system[:x_auth_token]
    end
  end
end
